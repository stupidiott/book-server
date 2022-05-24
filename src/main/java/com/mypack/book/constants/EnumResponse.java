package com.mypack.book.constants;

import lombok.Getter;

@Getter
public enum EnumResponse {

    BOOK_BORROWED(208,"You CAN'T delete a book that has been borrowed." ),

    SUCCESS(200, "Request Succeed"),
    FAIL(201, "Incorrect username or password"),

    LOGIN_INVALID_STATUS(202, "The current user has been disabled"),

    NOT_EXIST_USER(203, "Current user does not exist！"),

    USER_TOKEN_TIMEOUT(204, "User session timeout"),

    USERNAME_EXIST_EXCEPTION(205, "Account already exists"),

    OLD_PASSWORD_ERROR_EXCEPTION(206, "The original password is incorrect"),

    OLD_EMAIL_ERROR_EXCEPTION(208, "The original email address is incorrect"),

    ID_CART_NO_EXIST_EXCEPTION(207, "ID number already exists"),

    INVALID_PARAM(300, "Wrong parameters"),

    BOOK_NO_EXIST_EXCEPTION(401, "Book already exists"),

    SYSTEM_EXCEPTION(500,"System exception, please contact the administrator"),

    SOFTWARE_TIMEOUT_EXCEPTION(900,"");

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    private Integer code;

    private String message;

    EnumResponse(Integer code, String message) {
        this.code = code;
        this.message = message;
    }
}
