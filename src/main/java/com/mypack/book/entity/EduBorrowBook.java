package com.mypack.book.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.util.Date;

@Data
@TableName(value = "edu_borrow_book")
public class EduBorrowBook {

    @TableId(value = "id",type = IdType.AUTO)
    private Integer id;
    private String bookNo;
    private String borrowIdentityNo;
    private Date startTime;
    private Date endTime;
    private Date createTime;
    private Integer deleteFlag;
    private Date returnTime;

}
