
/*
 * 공통 관심 사항인 로거 기능을 클래스로 정의해놓고, aop를 이용하여 필요한 시점에 실행시키자.
 * */
package com.sai.common.log;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.aspectj.lang.ProceedingJoinPoint;

public class MyLogger {
	Logger logger=LogManager.getLogger(MyLogger.class);
	
	
	//디버깅 메서드 정의
	public Object showMsg(ProceedingJoinPoint joinPoint){
		Object obj = null;
		
		Object target = joinPoint.getTarget();
		String className = target.getClass().getName();
		String methodName = joinPoint.getSignature().getName();
		
		//타겟의 본래 로직 수행 전.. 하고 싶은 코드.
		try {
			
			logger.debug(className + "." + methodName +"수행전");
			obj = joinPoint.proceed();		//타켓의 본래 로직 수행
		} catch (Throwable e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			logger.debug(className + "." + methodName +"수행후");
		}

		
		//타겟의 본래 로직 수행 후.. 하고 싶은 코드
		
		return obj;
	}
}
