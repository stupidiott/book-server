package com.mypack.book.service.borrow;

import com.mypack.book.dto.borrow.BorrowBookDTO;
import com.mypack.book.dto.borrow.BorrowBookSearchDTO;

import java.util.List;

public interface BorrowBookService {


    List<BorrowBookDTO> list(BorrowBookSearchDTO searchDTO,boolean isPage);

    void add(BorrowBookDTO borrowBookDTO);

    void update(BorrowBookDTO borrowBookDTO);

}
