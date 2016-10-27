
/*
 * ���� ���� ������ �ΰ� ����� Ŭ������ �����س���, aop�� �̿��Ͽ� �ʿ��� ������ �����Ű��.
 * */
package com.sai.common.log;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.aspectj.lang.ProceedingJoinPoint;

public class MyLogger {
	Logger logger=LogManager.getLogger(MyLogger.class);
	
	
	//����� �޼��� ����
	public Object showMsg(ProceedingJoinPoint joinPoint){
		Object obj = null;
		
		Object target = joinPoint.getTarget();
		String className = target.getClass().getName();
		String methodName = joinPoint.getSignature().getName();
		
		//Ÿ���� ���� ���� ���� ��.. �ϰ� ���� �ڵ�.
		try {
			
			logger.debug(className + "." + methodName +"������");
			obj = joinPoint.proceed();		//Ÿ���� ���� ���� ����
		} catch (Throwable e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			logger.debug(className + "." + methodName +"������");
		}

		
		//Ÿ���� ���� ���� ���� ��.. �ϰ� ���� �ڵ�
		
		return obj;
	}
}
