package com.lei.spanner.core.util;


import com.lei.spanner.core.base.constants.DictCons;
import java.lang.annotation.Annotation;
import java.lang.reflect.Method;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.lang3.ArrayUtils;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

public class RequestUtils {

    public static final String REQ_TOKEN_NAME = "accessToken";
    public static final String REQ_CLIENT_TYPE = "clientType";

    public static final String REQ_REQUEST_ID = "requestId";

    public static final String REQ_PLATFORM_TYPE = "platformType";


    /**
     * 在aop中使用该方法，过滤controller方法中的入参，只取真正的参数类
     *
     * @param args
     * @return
     */
    public static String filterParams(Object[] args) {
        String requestJson = "";
        for (Object index : args) {
            if (index instanceof HttpServletRequest) {
                continue;
            }
            if (index instanceof HttpServletResponse) {
                continue;
            }
            if (index instanceof HttpSession) {
                continue;
            }
            if (index instanceof MultipartFile) {
                continue;
            }
            try {
            } catch (Exception e) {
                requestJson = "";
            }
            break;
        }
        return requestJson;
    }


    /**
     * 从header中获取accessToken(该方法以废弃)
     *
     * @param request
     * @return
     */
    public static String getAccessToken(HttpServletRequest request) {
        String accessToken = request.getHeader(REQ_TOKEN_NAME);
        return accessToken;
    }


    /**
     * 从header中获取accessToken
     *
     * @return
     */
    public static String getAccessToken() {
        HttpServletRequest request = RequestUtils.getRequest();
        String accessToken = request.getHeader(REQ_TOKEN_NAME);
        return accessToken;
    }


    /**
     * 从header中获取clientType：1-pcweb,2-app,3-小成员
     *
     * @return:1-pcweb,2-app,3-小成员
     */
    public static int getClientType() {

        HttpServletRequest request = RequestUtils.getRequest();
        String clientTypeStr = request.getHeader(REQ_CLIENT_TYPE);
        int clientType = DictCons.ClientType.WEB;
        if (TextUtils.isEmpty(clientTypeStr)) {
            return clientType;
        }
        if (clientTypeStr.matches("\\d{1}")) {
            clientType = Integer.parseInt(clientTypeStr);
        }
        if (clientType > 3 || clientType <= 0) {
            clientType = DictCons.ClientType.WEB;
        }
        if (clientType == 3 ) {
            clientType = DictCons.ClientType.WXMINI;
        }
        return clientType;
    }


    public static HttpServletRequest getRequest() {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        return request;
    }


    /**
     * 从头信息中获取域名信息
     *
     * @return
     */
    public static String getDomainByHeader() {
        HttpServletRequest request = RequestUtils.getRequest();
        String domain = request.getHeader("domain");
        return domain;
    }

    /**
     * 从header中获取requestId
     *
     * @return
     */
    public static String getRequestId() {
        HttpServletRequest request = RequestUtils.getRequest();
        String requestId = request.getHeader(REQ_REQUEST_ID);
        return requestId;
    }

    /**
     * 从头信息中获取域名信息
     *
     * @return
     */
    public static String getIpAddress() {
        HttpServletRequest request = RequestUtils.getRequest();
        String ip = request.getHeader("x-forwarded-for");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_CLIENT_IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_X_FORWARDED_FOR");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        return ip;
    }

    /**
     * 从header中获取platformType：1-大数据平台,2-中台
     *
     *
     */
    public static int getPlatformType () {

        HttpServletRequest request = RequestUtils.getRequest();
        String platformTypeStr = request.getHeader(REQ_PLATFORM_TYPE);
        int platformType = DictCons.GovSubjectPlatformType.BIG_DADA_PLATFORM;
        if (TextUtils.isEmpty(platformTypeStr)) {
            return platformType;
        }
        if (platformTypeStr.equals("1")) {
            platformType = DictCons.GovSubjectPlatformType.BIG_DADA_PLATFORM;
        }
        if (platformTypeStr.equals("2")) {
            platformType = DictCons.GovSubjectPlatformType.MIDDLE_PLATFORM;
        }

        return platformType;
    }
    /**
     * 获取@RequestBody注解的参数
     *
     * @param joinPoint
     * @return
     */
    public static Object getRequestBodyParam(ProceedingJoinPoint joinPoint) {
        Method method = ((MethodSignature) joinPoint.getSignature()).getMethod();
        Annotation[][] parameterAnnotations = method.getParameterAnnotations();
        if (parameterAnnotations == null) {
            return null;
        }


        Object param = null;
        for (Annotation[] index : parameterAnnotations) {
            int paramIndex = ArrayUtils.indexOf(parameterAnnotations, index);
            for (Annotation annotation : index) {
                if (annotation instanceof RequestBody) {
                    param = joinPoint.getArgs()[paramIndex];
                }
            }
        }

        return param;
    }
}
