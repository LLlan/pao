package com.didi.didims.push.gexin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.json.JSONObject;

import com.didi.common.constant.Dict;
import com.didi.common.util.PropertieUtil;
import com.didi.didims.pojo.Appuser;
import com.didi.didims.pojo.TipInfo;
import com.gexin.rp.sdk.base.IPushResult;
import com.gexin.rp.sdk.base.impl.ListMessage;
import com.gexin.rp.sdk.base.impl.SingleMessage;
import com.gexin.rp.sdk.base.impl.Target;
import com.gexin.rp.sdk.base.payload.APNPayload;
import com.gexin.rp.sdk.http.IGtPush;
import com.gexin.rp.sdk.template.NotificationTemplate;
import com.gexin.rp.sdk.template.TransmissionTemplate;

/**
 * 个推消息推送到list集合账号
 * 
 * @author liuyong
 * 
 */
public class PushToList {

    private static String APP_ID = "";

    private static String APPID = "";

    private static String APPKEY_DYNA = "";

    private static String APPKEY = "";

    private static String MASTER = "";

    private static String APPID_W = "";

    private static String APPKEY_W = "";

    private static String MASTER_W = "";

    private static String HTTP_HOST = "";

    // private static String HTTPS_HOST = "";

    // 读取配置文件
    private static PropertieUtil configProp = PropertieUtil.newInstance(Thread.currentThread().getContextClassLoader().getResource("").getPath() + "config/RestAPIConfig.properties");

    public PushToList() {
        if (null != configProp) {
            // 应用端配置
            APPID = configProp.getValue("GEXIN.APPID");
            APPKEY = configProp.getValue("GEXIN.APPKEY");
            MASTER = configProp.getValue("GEXIN.MASTER");

            // 师傅端配置
            APPID_W = configProp.getValue("GEXIN.APPID_W");
            APPKEY_W = configProp.getValue("GEXIN.APPKEY_W");
            MASTER_W = configProp.getValue("GEXIN.MASTER_W");

            // 个推API
            HTTP_HOST = configProp.getValue("GEXIN.HOST_HTTP1");
            // HTTPS_HOST = configProp.getValue("GEXIN.HOST_HTTPS");
        }
    }

    /**
     * 消息给单个用户发送消息
     * 
     * @param message
     * @param tipInfo
     * @param cId
     * @return
     */
    public TipInfo pushOperateToSingle(SingleMessage message, TipInfo tipInfo, String cId) {
        System.setProperty("gexin.rp.sdk.pushlist.needDetails", "true");
        IGtPush pushO = new IGtPush(HTTP_HOST, APPKEY, MASTER);

        // 发送目标
        Target target = new Target();
        target.setAppId(APP_ID);
        target.setClientId(cId);

        // 给单个用户发送消息
        IPushResult ret = pushO.pushMessageToSingle(message, target);
        String str = ret.getResponse().toString().replaceAll("=", ":");
        JSONObject obj = new JSONObject(str);
        if ("ok".equals(obj.get("result").toString())) {
            String status = obj.get("status").toString();
            if ("successed_online".equals(status) || "successed_offline".equals(status)) {
                tipInfo.setStatus(Dict.PUSH_STATUS.RECEIVE.getIndex());
            } else if ("SendError".equals(status)) {
                tipInfo.setStatus(Dict.PUSH_STATUS.NOT_RECEIVE.getIndex());
            } else {
                tipInfo.setStatus(Dict.PUSH_STATUS.INVALID.getIndex());
            }
        }
        return tipInfo;
    }

    /**
     * 消息给单个用户发送消息
     * 
     * @param message
     * @param tipInfo
     * @param cId
     * @return
     */
    public void pushOperateToList(ListMessage message, List<Appuser> users) {
        System.setProperty("gexin.rp.sdk.pushlist.needDetails", "true");
        IGtPush push_w = new IGtPush(HTTP_HOST, APPKEY_W, MASTER_W);

        List<Target> targetList = new ArrayList<Target>();
        for (Appuser user : users) {
            // 发送目标
            Target target = new Target();
            target.setAppId(APPID_W);
            target.setClientId(user.getCid());
            targetList.add(target);
        }

        // 给单个用户发送消息
        String contentId = push_w.getContentId(message);
        IPushResult d = push_w.pushMessageToList(contentId, targetList);
    }

    /**
     * 消息推送操作
     * 
     * @param list
     * @throws Exception
     */
    public List<TipInfo> pushOperate(Map<Integer, ListMessage> tipTypeMapApp, Map<Integer, List<TipInfo>> tipTypeListMapApp) throws Exception {
        List<TipInfo> tipList1 = new ArrayList<TipInfo>();
        System.setProperty("gexin.rp.sdk.pushlist.needDetails", "true");
        IGtPush push = null;
        IGtPush push_o = new IGtPush(HTTP_HOST, APPKEY, MASTER);
        IGtPush push_w = new IGtPush(HTTP_HOST, APPKEY_W, MASTER_W);
        for (Map.Entry<Integer, ListMessage> entry : tipTypeMapApp.entrySet()) {
            Integer tipType = entry.getKey();
            ListMessage message = entry.getValue();
            List<TipInfo> tipList = tipTypeListMapApp.get(tipType);
            if (Dict.ORDER_TIP_TYPE.O_ORDER_FEEDBACK.getIndex() == tipType || Dict.ORDER_TIP_TYPE.O_CANCEL.getIndex() == tipType || Dict.ORDER_TIP_TYPE.PLATFORM_O.getIndex() == tipType) {
                APP_ID = APPID;
                APPKEY_DYNA = APPKEY;
                push = push_o;
            } else if (Dict.ORDER_TIP_TYPE.W_GRAB.getIndex() == tipType || Dict.ORDER_TIP_TYPE.W_GRAB_SUCC.getIndex() == tipType || Dict.ORDER_TIP_TYPE.W_GRAB_FAIL.getIndex() == tipType
                    || Dict.ORDER_TIP_TYPE.W_SERVICE_EVALUATE.getIndex() == tipType || Dict.ORDER_TIP_TYPE.PLATFORM_W.getIndex() == tipType) {
                APP_ID = APPID_W;
                APPKEY_DYNA = APPKEY_W;
                push = push_w;
            }
            String taskId = push.getContentId(message);
            tipList1.addAll(doPush(tipList, taskId, push));
        }

        return tipList1;
    }

    /**
     * 推送
     * 
     * @param tipList
     * @param taskId
     * @param push
     * @return
     */
    public List<TipInfo> doPush(List<TipInfo> tipList, String taskId, IGtPush push) {
        List<Target> targets = new ArrayList<Target>();
        Map<String, Object> resultMap1 = new HashMap<String, Object>();
        Map<String, Object> resultMap = new HashMap<String, Object>();

        int count = 0;
        for (TipInfo tip : tipList) {
            String cid = tip.getAppUser().getCid();
            Target target = new Target();
            target.setAppId(APP_ID);
            target.setClientId(cid);
            targets.add(target);
            count++;

            // 每50条发送一次
            if (count >= 50) {
                count = 0;
                IPushResult ret = push.pushMessageToList(taskId, targets);
                resultMap1 = stringToJSON(ret.getResponse().toString());
                resultMap.putAll(resultMap1);

                // 清楚已经发送的信息。
                targets.clear();
            }
        }

        if (targets.size() > 0) {
            // 发送不足50条的信息
            IPushResult ret = push.pushMessageToList(taskId, targets);
            resultMap1 = stringToJSON(ret.getResponse().toString());
            resultMap.putAll(resultMap1);
        }

        // 更改消息状态
        for (TipInfo tip : tipList) {
            String cid = tip.getAppUser().getCid();
            if (resultMap.get(cid).equals("successed_online") || resultMap.get(cid).equals("successed_offline")) {
                tip.setStatus(Dict.PUSH_STATUS.RECEIVE.getIndex());
            } else if (resultMap.get(cid).equals("SendError")) {
                tip.setStatus(Dict.PUSH_STATUS.NOT_RECEIVE.getIndex());
            } else {
                tip.setStatus(Dict.PUSH_STATUS.INVALID.getIndex());
            }
        }

        return tipList;
    }

    /**
     * 设置通知模板 （暂时未用）
     * 
     * @return
     * @throws Exception
     */
    public static NotificationTemplate NotificationTemplateDemo(TipInfo tip) throws Exception {
        NotificationTemplate template = new NotificationTemplate();
        template.setAppId(APP_ID);
        template.setAppkey(APPKEY_DYNA);
        template.setTitle("滴滴快修通知");
        template.setText(tip.getContent());
        template.setLogo("icon.png");
        template.setIsRing(true);
        template.setIsVibrate(true);
        template.setIsClearable(true);
        template.setTransmissionType(2);
        template.setTransmissionContent(tip.getContent());
        return template;
    }

    /**
     * 设置透传模板
     * 
     * @return
     * @throws Exception
     */
    public static TransmissionTemplate TransmissionTemplateDemo(TipInfo tip, Integer type, boolean isApn) throws Exception {
        TransmissionTemplate template = new TransmissionTemplate();
        if (type == 8) {
            // 师傅端
            APP_ID = APPID_W;
            APPKEY_DYNA = APPKEY_W;
        }
        if (type == 7) {
            // 用户端
            APP_ID = APPID;
            APPKEY_DYNA = APPKEY;
        }

        template.setAppId(APP_ID);
        template.setAppkey(APPKEY_DYNA);

        // 透传内容
        template.setTransmissionContent(tip.getContent());
        template.setTransmissionType(2); // 一定设置为2

        if (isApn) {
            // IOS端通知消息
            APNPayload payload = new APNPayload();
            payload.setBadge(1);
            payload.setContentAvailable(1);
            payload.setSound("default");
            payload.setCategory("$由客户端定义");

            // 字典模式使用下者
            payload.setAlertMsg(new APNPayload.SimpleAlertMsg(tip.getApnContent()));
            template.setAPNInfo(payload);
        }
        return template;
    }

    /**
     * JSON转换
     * 
     * @param res
     *            JSON字符串
     * @return
     */
    public static Map<String, Object> stringToJSON(String res) {

        Map<String, Object> map = new HashMap<String, Object>();
        String str = res.replaceAll("=", ":");
        JSONObject obj = new JSONObject(str);

        Object detailObj = obj.get("details");
        if (null != detailObj) {
            JSONObject json = new JSONObject(detailObj.toString());

            @SuppressWarnings("rawtypes")
            Iterator iterator = json.keys();
            while (iterator.hasNext()) {
                String key = (String) iterator.next();
                String value = json.getString(key);
                map.put(key, value);
            }
        }
        return map;
    }
}
