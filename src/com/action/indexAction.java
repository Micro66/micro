package com.action;

import com.dao.TCatelogDAO;
import com.dao.TShipinDAO;
import com.model.TCatelog;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import java.util.List;
import java.util.Map;

public class indexAction extends ActionSupport
{
	private TCatelogDAO catelogDAO;
	private TShipinDAO shipinDAO;
	
	public String index()
	{
		Map request=(Map)ServletActionContext.getContext().get("request");
		String sql="from TCatelog where catelogDel='no'";
		List cateLogList=catelogDAO.getHibernateTemplate().find(sql);
		for(int i=0;i<cateLogList.size();i++)
		{
			TCatelog catelog=(TCatelog)cateLogList.get(i);
			String sql1="from TShipin where del='no' and catelogId="+catelog.getCatelogId();
			List shipinList=shipinDAO.getHibernateTemplate().find(sql1);
			catelog.setShipinList(shipinList);
		}
		
		request.put("cateLogList", cateLogList);
		return ActionSupport.SUCCESS;
	}

	public TCatelogDAO getCatelogDAO()
	{
		return catelogDAO;
	}

	public void setCatelogDAO(TCatelogDAO catelogDAO)
	{
		this.catelogDAO = catelogDAO;
	}

	public TShipinDAO getShipinDAO()
	{
		return shipinDAO;
	}

	public void setShipinDAO(TShipinDAO shipinDAO)
	{
		this.shipinDAO = shipinDAO;
	}

}
