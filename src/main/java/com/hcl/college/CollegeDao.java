package com.hcl.college;

import java.beans.FeatureDescriptor;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.cfg.Configuration;


public class CollegeDao {
	
	public String insertSubjects(Subjects ob){
		Configuration cfg = new AnnotationConfiguration();
		cfg.configure("hibernate.cfg.xml");
		SessionFactory sf=cfg.buildSessionFactory();
		Session s=sf.openSession();
		Transaction t = s.beginTransaction();
		s.save(ob);
		t.commit();
		return "Subject Inseted";
		
	}
	
	public List<String> searchIns(){
		Configuration cfg = new AnnotationConfiguration();
		cfg.configure("hibernate.cfg.xml");
		SessionFactory sf=cfg.buildSessionFactory();
		Session s=sf.openSession();
		Query q=s.createQuery("SELECT DISTINCT instructor from Subjects");
		List<String> list=q.list();
		return list;
	}
	
	public List<String> searchSub(){
		Configuration cfg = new AnnotationConfiguration();
		cfg.configure("hibernate.cfg.xml");
		SessionFactory sf=cfg.buildSessionFactory();
		Session s=sf.openSession();
		Query q=s.createQuery("SELECT DISTINCT subject from Subjects");
		List<String> list=q.list();
		return list;
	}
	
	public String insertFeedback(Feedback ob){
		Configuration cfg = new AnnotationConfiguration();
		cfg.configure("hibernate.cfg.xml");
		SessionFactory sf=cfg.buildSessionFactory();
		Session s=sf.openSession();
		Query q=s.createQuery("select count(*) from Subjects where instructor='"+ob.getInstructor()+"'and subject='"+ob.getSubject()+"'");
		List<Long> list=q.list();
		long count = list.get(0);
		if(count>0){
		ob.setFid(new CollegeDao().generateId());
		Transaction t = s.beginTransaction();
		s.save(ob);
		t.commit();
		return "Feedback Inseted";
		} else {
			return "Instructor "+ob.getInstructor()+" is Not Teaching "+ob.getSubject();
		}
		
	}
	
	public String generateId(){
		Configuration cfg = new AnnotationConfiguration();
		cfg.configure("hibernate.cfg.xml");
		SessionFactory sf=cfg.buildSessionFactory();
		Session s=sf.openSession();
		Query q=s.createQuery("SELECT MAX(fid) from Feedback");
		List<String> list=q.list();
		String fid = list.get(0);
		if(fid == null)return "C001";
		fid = "C"+String.format("%03d",(Integer.parseInt(fid.substring(1))+1));
		return fid;
	}

}
