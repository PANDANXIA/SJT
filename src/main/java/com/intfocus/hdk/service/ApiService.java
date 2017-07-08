package com.intfocus.hdk.service;

import com.intfocus.hdk.vo.PortalDataSource;
import com.intfocus.hdk.vo.PortalExecuteSql;
import com.intfocus.hdk.vo.PortalProcedure;
import com.intfocus.hdk.vo.PortalReport;

import java.util.List;
import java.util.Map;

/**
 * api系统总接口
 * <p>
 * Created by 张海 on 2017/05/11
 */
public interface ApiService {

    /**
     * 通过存储过程获取数据
     *
     * @param report
     * @param portalPro
     * @param portalDataSource
     * @param parameter
     * @return
     */
    List<Map<String, Object>> getListResultListMapByPro(PortalReport report, PortalProcedure portalPro, PortalDataSource portalDataSource, String parameter);

    /**
     * 通过sql获取数据
     *
     * @param report
     * @param portalExecuteSql
     * @param portalDataSource
     * @param parameter
     * @return
     */
    List<Map<String, Object>> getListResultListMapBySql(PortalReport report, PortalExecuteSql portalExecuteSql, PortalDataSource portalDataSource, String parameter);


}
