package com.didi.didims.service;

import com.didi.didims.pojo.Opinion;
import java.util.List;
import java.util.Map;
import com.didi.common.pojo.Page;

public interface IOpinionService {

	Page queryOpinionPageList(Opinion param, Page page);
	
	Opinion queryOpinion(Opinion param);

	List<Opinion> queryOpinionList(Opinion param);

	void insertOpinion(Opinion param);
	
	void updateOpinion(Opinion param);
	
	void deleteOpinion(Opinion param);
	
}