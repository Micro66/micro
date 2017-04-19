package com.action;

import com.dao.TCatelogDAO;
import com.dao.TShipinDAO;
import com.model.TShipin;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import java.util.List;
import java.util.Map;

public class shipinAction extends ActionSupport
{
	private int id;
	private int catelogId;
	private String name;
	private String fujian;

	private String fujianYuanshiming;
	private String geshou;
	private String shijian;
	private Integer userId=0;
	private String del;


	private String message;
	private String path;

	private TCatelogDAO catelogDAO;
	private TShipinDAO shipinDAO;



	public String shipinAdd()
	{
		TShipin shipin=new TShipin();
		shipin.setCatelogId(catelogId);
		shipin.setName(name);
		shipin.setFujian(fujian);
		shipin.setFujianYuanshiming(fujianYuanshiming);
		shipin.setGeshou(geshou);
		shipin.setShijian(shijian);
		shipin.setUserId(userId);//dianjilv
		shipin.setDel("no");
		shipinDAO.save(shipin);
		this.setMessage("操作成功");
		this.setPath("shipinMana.action");
		return "succeed";
	}

	public String shipinAdd1()
	{
		TShipin shipin=new TShipin();
		shipin.setCatelogId(catelogId);
		shipin.setName(name);
		shipin.setFujian(fujian);
		shipin.setFujianYuanshiming(fujianYuanshiming);
		shipin.setGeshou(geshou);
		shipin.setShijian(shijian);
		shipin.setUserId(userId);//dianjilv
		shipin.setDel("shenqing");
		shipinDAO.save(shipin);
		this.setMessage("操作成功");
		return "succeed";
	}
	public String shipinShenqingMana()
	{
		String sql="from TShipin where del='shenqing'";
		List shipinList=shipinDAO.getHibernateTemplate().find(sql);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("shipinList", shipinList);
		return ActionSupport.SUCCESS;
	}


	public String shipinPiZhun()
	{
		TShipin shipin=shipinDAO.findById(id);
		shipin.setDel("no");
		shipinDAO.attachDirty(shipin);
		this.setMessage("操作成功");
		this.setPath("shipinMana.action");
		return "succeed";
	}


	public String shipinMana()
	{
		String sql="from TShipin where del='no'";
		List shipinList=shipinDAO.getHibernateTemplate().find(sql);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("shipinList", shipinList);
		return ActionSupport.SUCCESS;
	}

	public String shipinDel()
	{
		TShipin shipin=shipinDAO.findById(id);
		shipin.setDel("yes");
		shipinDAO.attachDirty(shipin);
		this.setMessage("操作成功");
		this.setPath("shipinMana.action");
		return "succeed";
	}

	public String shipinDetailQian()
	{
		TShipin shipin=shipinDAO.findById(id);
		shipin.setUserId(shipin.getUserId()+1);
		shipinDAO.attachDirty(shipin);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("shipin", shipin);
		return ActionSupport.SUCCESS;
	}


	public String shipinMoreByCatelog()
	{
		String sql="from TShipin where del='no' and catelogId="+catelogId;;
		List shipinList=shipinDAO.getHibernateTemplate().find(sql);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("shipinList", shipinList);
		return ActionSupport.SUCCESS;
	}


	public String shipinSearch()
	{
		StringBuffer sql=new StringBuffer("from TShipin where del='no' and name like '%"+name+"%'" +" and geshou like '%"+geshou+"%'");
		System.out.println(sql.toString());
		List shipinList=shipinDAO.getHibernateTemplate().find(sql.toString());
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("shipinList", shipinList);
		return ActionSupport.SUCCESS;
	}

	public String shipinPaihang()
	{
		String sql="from TShipin where del='no' order by userId desc";
		List shipinList=shipinDAO.getHibernateTemplate().find(sql);
		if(shipinList.size()>6)
		{
			shipinList=shipinList.subList(0, 6);
		}
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("shipinList", shipinList);
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

	public int getCatelogId()
	{
		return catelogId;
	}

	public void setCatelogId(int catelogId)
	{
		this.catelogId = catelogId;
	}

	public String getDel()
	{
		return del;
	}

	public void setDel(String del)
	{
		this.del = del;
	}

	public String getFujian()
	{
		return fujian;
	}

	public void setFujian(String fujian)
	{
		this.fujian = fujian;
	}

	public String getFujianYuanshiming()
	{
		return fujianYuanshiming;
	}

	public void setFujianYuanshiming(String fujianYuanshiming)
	{
		this.fujianYuanshiming = fujianYuanshiming;
	}

	public String getGeshou()
	{
		return geshou;
	}

	public void setGeshou(String geshou)
	{
		this.geshou = geshou;
	}

	public int getId()
	{
		return id;
	}

	public TShipinDAO getShipinDAO()
	{
		return shipinDAO;
	}

	public void setShipinDAO(TShipinDAO shipinDAO)
	{
		this.shipinDAO = shipinDAO;
	}

	public void setId(int id)
	{
		this.id = id;
	}

	public String getMessage()
	{
		return message;
	}

	public void setMessage(String message)
	{
		this.message = message;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getPath()
	{
		return path;
	}

	public void setPath(String path)
	{
		this.path = path;
	}

	public String getShijian()
	{
		return shijian;
	}

	public void setShijian(String shijian)
	{
		this.shijian = shijian;
	}

	public Integer getUserId()
	{
		return userId;
	}

	public void setUserId(Integer userId)
	{
		this.userId = userId;
	}

}
