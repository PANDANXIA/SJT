package com.intfocus.hdk.dao;

import com.intfocus.hdk.vo.PortalReport;
import org.apache.ibatis.annotations.Param;

/**
 * 报表、数据结果集信息
 * Created by 张海 on 2017/05/11
 */
public interface PortalReportMapper extends BaseMapper<PortalReport> {

    /**
     * 根据编码查询
     * @param code
     * @return
     */
    PortalReport queryObjectByCode(@Param("code") String code);

    void deleteBatchByCodes(String[] codes);
}
