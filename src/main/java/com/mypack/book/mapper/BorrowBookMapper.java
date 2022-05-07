package com.mypack.book.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.mypack.book.dto.borrow.BorrowBookDTO;
import com.mypack.book.dto.borrow.BorrowBookSearchDTO;
import com.mypack.book.entity.EduBorrowBook;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BorrowBookMapper extends BaseMapper<EduBorrowBook> {


    List<BorrowBookDTO> list(BorrowBookSearchDTO searchDTO);


    List<BorrowBookDTO> listByUsername(String username);

    String getUsernameById(Integer id);
}
