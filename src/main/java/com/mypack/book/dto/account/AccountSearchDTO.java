package com.mypack.book.dto.account;

import com.mypack.book.dto.PageForm;
import lombok.Data;

@Data
public class AccountSearchDTO extends PageForm {

    private String username;
    private Integer status;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
