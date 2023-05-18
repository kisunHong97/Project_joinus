package com.ezen.joinus.controller;



import com.ezen.joinus.vo.ChatMessage;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/sample")
public class SampleController {
	@MessageMapping("/chat")
	@SendTo("/topic/messages")
	public ChatMessage sendMessage(ChatMessage chatMessage) {
		return chatMessage;
	}

	@GetMapping(value = "/question")
	public String getText2(ChatMessage vo ,Model model) {
		System.out.println(vo);
		RestTemplate restTemplate = new RestTemplate();
        String url = "http://localhost:5000/";
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        HttpEntity<ChatMessage> request = new HttpEntity<ChatMessage>(vo, headers);
        String response = restTemplate.postForObject(url, request, String.class);
        System.out.println(response);
		model.addAttribute("answer", response);
		return "answer";
	}



}
