package com.demo.session;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

public class CookieManager {
    public static final String USER_ID_COOKIE = "userIdCookie";

    public static Cookie createUserIdCookie(String userId, HttpServletRequest request) {
        String userIdCookieValue = userId.trim();
        Cookie userIdCookie = new Cookie(USER_ID_COOKIE, userIdCookieValue);
        userIdCookie.setMaxAge(-1); // no expiration
        userIdCookie.setPath("/");
        String domain = request.getServerName();
        userIdCookie.setDomain(domain);
        return userIdCookie;
    }

    public static String getUserId(Cookie cookie) {
        String name = cookie.getName();
        if (!USER_ID_COOKIE.equals(name)) {
            throw new IllegalArgumentException("invalid cookie name: " + name);
        }
        String val = cookie.getValue();
        return val;
    }

    public static void destroyCookie(Cookie cookie, HttpServletRequest request) {
        cookie.setValue("");
        String domain = request.getServerName();
        cookie.setDomain(domain);
        cookie.setPath("/");
        cookie.setMaxAge(0);
    }
}
