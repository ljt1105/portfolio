package com.traveler.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.traveler.vo.BoardVO;

// BoardMapper.xml 파일과 매핑되는 인터페이스 정의
// -> BoardMapper.xml과 경로와 이름이 일치하도록 작성
@Mapper	// board-context.xml의 <bean id="boardMapper" class="...MapperFactoryBean"> ... </bean> 을 대신해주는 어노테이션 
public interface BoardMapper {
	
	// 인터페이스메서드는 BoardMapper.xml 파일의 insert, update, select,
	void insertBoard(BoardVO board);
	
	List<BoardVO> selectAll();
	
	BoardVO selectBoardByBoardNo(int boardNo);

	void updateBoardDeleted(int boardNo);

	void updateBoardReadCount(int boardNo);

	void updateBoard(BoardVO board);
}
