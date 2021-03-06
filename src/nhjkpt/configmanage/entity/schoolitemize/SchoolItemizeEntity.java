package nhjkpt.configmanage.entity.schoolitemize;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;
import javax.persistence.SequenceGenerator;

/**   
 * @Title: Entity
 * @Description: 学校分类用能计算用表
 * @author qf
 * @date 2013-08-02 01:00:14
 * @version V1.0   
 *
 */
@Entity
@Table(name = "schoolitemize", schema = "")
@SuppressWarnings("serial")
public class SchoolItemizeEntity implements java.io.Serializable {
	/**主键id*/
	private java.lang.String id;
	/**分类*/
	private java.lang.String itemizeid;
	/**表具*/
	private java.lang.String meterid;
	/**功能*/
	private java.lang.String funcid;
	/**拆分系数*/
	private java.lang.Integer factor;
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  主键id
	 */
	
	@Id
	@GeneratedValue(generator = "paymentableGenerator")
	@GenericGenerator(name = "paymentableGenerator", strategy = "uuid")
	@Column(name ="ID",nullable=true,length=32)
	public java.lang.String getId(){
		return this.id;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  主键id
	 */
	public void setId(java.lang.String id){
		this.id = id;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  分类
	 */
	@Column(name ="ITEMIZEID",nullable=true,length=32)
	public java.lang.String getItemizeid(){
		return this.itemizeid;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  分类
	 */
	public void setItemizeid(java.lang.String itemizeid){
		this.itemizeid = itemizeid;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  表具
	 */
	@Column(name ="METERID",nullable=true,length=32)
	public java.lang.String getMeterid(){
		return this.meterid;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  表具
	 */
	public void setMeterid(java.lang.String meterid){
		this.meterid = meterid;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  功能
	 */
	@Column(name ="FUNCID",nullable=true,length=32)
	public java.lang.String getFuncid(){
		return this.funcid;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  功能
	 */
	public void setFuncid(java.lang.String funcid){
		this.funcid = funcid;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  拆分系数
	 */
	@Column(name ="FACTOR",nullable=true,precision=10,scale=0)
	public java.lang.Integer getFactor(){
		return this.factor;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  拆分系数
	 */
	public void setFactor(java.lang.Integer factor){
		this.factor = factor;
	}
}
