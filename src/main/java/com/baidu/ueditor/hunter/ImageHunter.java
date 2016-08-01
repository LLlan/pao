package com.baidu.ueditor.hunter;

import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.params.CoreConnectionPNames;
import org.apache.http.util.EntityUtils;
import org.csource.client.Client;

import com.baidu.ueditor.PathFormat;
import com.baidu.ueditor.define.AppInfo;
import com.baidu.ueditor.define.BaseState;
import com.baidu.ueditor.define.MIMEType;
import com.baidu.ueditor.define.MultiState;
import com.baidu.ueditor.define.State;
import com.didi.common.constant.Config;
import com.didi.common.constant.RedisKeys;
import com.didi.common.util.FileUtil;

/**
 * 图片抓取器
 * @author hancong03@baidu.com
 *
 */
public class ImageHunter {
	
	private String filename = null;
	private String savePath = null;
	private String rootPath = null;
	private List<String> allowTypes = null;
	private long maxSize = -1;
	
	private List<String> filters = null;
	
	public ImageHunter ( Map<String, Object> conf ) {
		
		this.filename = (String)conf.get( "filename" );
		this.savePath = (String)conf.get( "savePath" );
		this.rootPath = (String)conf.get( "rootPath" );
		this.maxSize = (Long)conf.get( "maxSize" );
		this.allowTypes = Arrays.asList( (String[])conf.get( "allowFiles" ) );
		this.filters = Arrays.asList( (String[])conf.get( "filter" ) );
		
	}
	
	public State capture ( String[] list ) {
		
		MultiState state = new MultiState( true );
		
		for ( String source : list ) {
			state.addState( captureRemoteData( source ) );
		}
		
		return state;
		
	}

	public State captureRemoteData ( String urlStr ) {
		
		HttpURLConnection connection = null;
		URL url = null;
		String suffix = null;
		String trueUrl=null;

        HttpClient client = new DefaultHttpClient();  
        client.getParams().setParameter(CoreConnectionPNames.CONNECTION_TIMEOUT, 5000);  
        HttpGet get = new HttpGet(urlStr);  
        get.getParams().setParameter(CoreConnectionPNames.CONNECTION_TIMEOUT, 5000);  
        State state = new BaseState(true);
        try {  
            HttpResponse resonse = client.execute(get);  
            if (resonse.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {  
                HttpEntity entity = resonse.getEntity();  
                if (entity != null) {  
                    Client fileClient = new Client();
                    byte[] b = EntityUtils.toByteArray(entity);
                    //获取文件的绝对路径;
                    String logoId = fileClient.upload(b, FileUtil.getExtName(urlStr), null);
                    String configKey = RedisKeys.CORE_CONFIG + Config.PIC_URL.getId();
//              	  	String pic_rl =  iredisdao.get(configKey);
                   /* IConfigService configService = SpringContextHolder.getBean("configService");
                    Config c = new Config();
                    c.setId("static_file_address");
                    Config config = configService.queryConfig(c);*/
//                    trueUrl= pic_rl + logoId;
                    state.putInfo( "size", b.length );
                    state.putInfo( "title", logoId);
                }  
            }  
            
			url = new URL( urlStr );

			if ( !validHost( url.getHost() ) ) {
				return new BaseState( false, AppInfo.PREVENT_HOST );
			}
			
			connection = (HttpURLConnection) url.openConnection();
		
			connection.setInstanceFollowRedirects( true );
			connection.setUseCaches( true );
		
			if ( !validContentState( connection.getResponseCode() ) ) {
				return new BaseState( false, AppInfo.CONNECTION_ERROR );
			}
			
			suffix = MIMEType.getSuffix( connection.getContentType() );
			
			if ( !validFileType( suffix ) ) {
				return new BaseState( false, AppInfo.NOT_ALLOW_FILE_TYPE );
			}
			
			if ( !validFileSize( connection.getContentLength() ) ) {
				return new BaseState( false, AppInfo.MAX_SIZE );
			}
			
			String savePath = this.getPath( this.savePath, this.filename, suffix );

			if ( state.isSuccess() ) {
				state.putInfo( "url", PathFormat.format( trueUrl ) );
				state.putInfo( "source", urlStr );
			}
			
			return state;
			
		} catch ( Exception e ) {
			return new BaseState( false, AppInfo.REMOTE_FAIL );
		}finally {  
            client.getConnectionManager().shutdown();  
        } 
		
	}
	
	private String getPath ( String savePath, String filename, String suffix  ) {
		
		return PathFormat.parse( savePath + suffix, filename );
		
	}
	
	private boolean validHost ( String hostname ) {
		
		return !filters.contains( hostname );
		
	}
	
	private boolean validContentState ( int code ) {
		
		return HttpURLConnection.HTTP_OK == code;
		
	}
	
	private boolean validFileType ( String type ) {
		
		return this.allowTypes.contains( type );
		
	}
	
	private boolean validFileSize ( int size ) {
		return size < this.maxSize;
	}
	
}
