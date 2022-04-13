package com.mypack.book.dto;

import lombok.Data;

import java.io.Serializable;

@Data
public class LogoutDTO implements Serializable {
    private static final long serialVersionUID = -1808577264298918545L;
    private String username;
}
