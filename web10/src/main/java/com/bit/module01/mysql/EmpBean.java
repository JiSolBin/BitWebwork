package com.bit.module01.mysql;

// javaBean class (= DTO, VO, Entry/Entity)
// 필드와 getter setter
public class EmpBean {
	public int empno;
	public String ename;
	public int sal;
	
	// getter & setter
	public int getEmpno() {
		return empno;
	}

	public void setEmpno(int empno) {
		this.empno = empno;
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	public int getSal() {
		return sal;
	}

	public void setSal(int sal) {
		this.sal = sal;
	}

	@Override
	public String toString() {
		return "empno:"+empno+", ename:"+ename+", sal:"+sal;
	}
}
