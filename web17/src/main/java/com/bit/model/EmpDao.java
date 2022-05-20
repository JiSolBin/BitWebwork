package com.bit.model;

import java.security.interfaces.RSAKey;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.bson.Document;

import com.mongodb.BasicDBObject;
import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;

public class EmpDao {
	String addr = "localhost:27017";
	MongoClient client = null;
	
	public List<Map<String, Object>> selectAll(){
		
		List<Map<String, Object>> list = new ArrayList<>();
		try {
			client = new MongoClient(addr);
			MongoDatabase db = client.getDatabase("testDB");
			MongoCollection<Document> rs = db.getCollection("emp");
			MongoCursor<Document> cur = rs.find().iterator();
			while(cur.hasNext()) {
				Map<String, Object> bean = new HashMap<String, Object>();
				Document doc = cur.next();
				bean.put("_id", doc.get("_id"));
				bean.put("empno", doc.get("empno"));
				bean.put("ename", doc.get("ename"));
				list.add(bean);
			}
		} finally {
			if(client!=null) client.close();
		}
		
		return list;
	}

	public void insertOne(int empno, String ename) {
		
		try {
			client = new MongoClient(addr);
			MongoDatabase db = client.getDatabase("testDB");
			MongoCollection<Document> coll = db.getCollection("emp");
			
			Document doc = new Document();
			doc.append("empno", empno);
			doc.append("ename", ename);
			coll.insertOne(doc );
		} finally {
			if(client!=null) client.close();
		}
	}
	
}
