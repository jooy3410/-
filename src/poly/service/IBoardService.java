package poly.service;

import java.util.List;

import poly.dto.BoardDTO;

public interface IBoardService {
	
	List<BoardDTO> getBoardList() throws Exception;

	int insertPost(BoardDTO pDTO) throws Exception;

	BoardDTO getPostDetail(BoardDTO pDTO) throws Exception;

	int deletePost(BoardDTO pDTO) throws Exception;

	int updatePost(BoardDTO pDTO) throws Exception;

}
