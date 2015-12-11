package org.anran.service;

import java.util.List;

import org.anran.common.util.PageList;
import org.anran.common.util.PageListUtil;
import org.anran.dao.AccountDao;
import org.anran.dao.VipDao;
import org.anran.model.Account;
import org.anran.model.AccountSearchModel;
import org.anran.model.Vip;
import org.anran.model.VipSearchModel;
import org.hibernate.Criteria;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class VipService {
	
	@Autowired
	protected VipDao vipDao;
	
	@Autowired
	protected AccountDao accountDao;
	
	/**
	 * 获取vip会员分页信息
	 * @param name
	 * @param username
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public PageList<Vip> queryVipPage(VipSearchModel v){
		Criteria countCriteria = vipDao.getCriteria();	
		Criteria listCriteria = vipDao.getCriteria();
		String name = v.getName();
		String card = v.getCard();
		String phone = v.getPhone();
		int pageNo = v.getPageNo();
		int pageSize = v.getPageSize();
		Criterion cri_name = (name!=null && !name.isEmpty())?Restrictions.like("name", "%"+name+"%"):Restrictions.sqlRestriction("1=1");
		Criterion cri_card = (card!=null && !card.isEmpty())?Restrictions.like("card", "%"+card+"%"):Restrictions.sqlRestriction("1=1");
		Criterion cri_phone = (phone!=null && !phone.isEmpty())?Restrictions.like("phone", "%"+phone+"%"):Restrictions.sqlRestriction("1=1");
/*		if(name!=null && !name.isEmpty()){
			criterion = Restrictions.like("name", "%"+name+"%");
		}
		if(card!=null && !card.isEmpty()){
			if(criterion != null){
				criterion = Restrictions.and(criterion, Restrictions.like("card", "%"+card+"%"));
			}else{
				criterion = Restrictions.like("card", "%"+card+"%");
			}
		}
		if(phone!=null && !phone.isEmpty()){
			if(criterion != null){
				criterion = Restrictions.and(criterion, Restrictions.like("card", "%"+card+"%"));
			}else{
				criterion = Restrictions.like("card", "%"+card+"%");
			}
		}*/
		countCriteria.add(cri_name).add(cri_card).add(cri_phone);
		listCriteria.add(cri_name).add(cri_card).add(cri_phone);
        listCriteria.setFirstResult((pageNo-1)*pageSize);  
        listCriteria.setMaxResults(pageSize);
        List<Vip> items = listCriteria.list();
        countCriteria.setProjection(Projections.rowCount());
        Integer count=Integer.parseInt(countCriteria.uniqueResult().toString());
        return PageListUtil.getPageList(count, pageNo, pageSize, items);
    }
	
	/**
	 * 获取某个Vip，关联的账户信息未加载
	 * @param vipId
	 * @return
	 */
	public Vip getVipById(int vipId) {
		return vipDao.get(vipId);
	}
	
	
	/**
	 * 新增一个vip信息
	 * @param vip
	 */
	public void addVip(Vip vip) {
		vipDao.save(vip);
	}
	
	/**
	 * 更改vip信息
	 * @param vip
	 */
	public void updateVip(Vip vip) {
		vipDao.update(vip);
	}
	
	/**
	 * 删除一个vip信息
	 * @param vipId
	 */
	public void deleteVip(int vipId) {	
		Vip vip = vipDao.load(vipId);
		vipDao.remove(vip);
	}

	public List getMaxCard(){
		return vipDao.find("select max(v.card) from Vip v");
	}
	
	
/**
 * bill begin
 */
	/**
	 * 获取会员账单分页信息
	 * @param vipId
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public PageList<Account> queryAccountPage(AccountSearchModel asm){
		Criteria countCriteria = accountDao.getCriteria();	
		Criteria listCriteria = accountDao.getCriteria();
		Criterion criterion = Restrictions.eq("vip.id", asm.getVipId()) ;
		countCriteria.add(criterion);
		listCriteria.add(criterion);
		int pageNo = asm.getPageNo();
		int pageSize = asm.getPageSize();
        listCriteria.setFirstResult((pageNo-1)*pageSize);  
        listCriteria.setMaxResults(pageSize);
        List<Account> items = listCriteria.list();
        countCriteria.setProjection(Projections.rowCount());
        Integer count=Integer.parseInt(countCriteria.uniqueResult().toString());
        return PageListUtil.getPageList(count, pageNo, pageSize, items);
    }
	
	
	/**
	 * 获取某个账单
	 * @param accId
	 * @return
	 */
	public Account getBillById(int accId) {
		Account acc = accountDao.get(accId);
		accountDao.initialize(acc.getVip());
		return acc;
	}
	
	/**
	 * 新增一个账单信息
	 * @param account
	 */
	public void addBill(Account account) {
		accountDao.save(account);
	}
	
	/**
	 * 更改账单信息
	 * @param acc
	 */
	public void updateBill(Account acc) {
		accountDao.update(acc);
	}
	
	/**
	 * 删除一个账单信息
	 * @param accId
	 */
	public int deleteBill(int accId) {	
		Account acc = accountDao.load(accId);
		int vid = acc.getVip().getId();
		accountDao.remove(acc);
		return vid;
	}
}
