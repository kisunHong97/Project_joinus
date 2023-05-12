
package com.ezen.joinus.dto;


import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class AttachFileDTO {
    private int fno;
    private int pno;
    private String fileName;	// 파일 이름
    private String uploadPath;	// 폴더 위치
    private String uuid;		// 파일 중복 방지 키워드
    private char image;		// 이미지파일인지 판단 'T' = true, 'F' = false
}