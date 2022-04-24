package com.mypack.book.exception;

import com.mypack.book.constants.EnumResponse;
import lombok.Data;

@Data
public class UsernameExistException extends Exception {


    private EnumResponse enumResponse;

    public UsernameExistException() {
        super();
    }

    public UsernameExistException(EnumResponse enumResponse){
        this.enumResponse = enumResponse;
    }

    public UsernameExistException(String message) {
        super(message);
    }


    public UsernameExistException(String message, Throwable cause) {
        super(message, cause);
    }


    public UsernameExistException(Throwable cause) {
        super(cause);
    }


    protected UsernameExistException(String message, Throwable cause,
                                     boolean enableSuppression,
                                     boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }

}
