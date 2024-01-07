package com.project.apa.api.community;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;
import com.project.apa.api.community.service.CommunityService;

@RestController
public class RestCommunityController {
	
	@Autowired
	CommunityService communityservice;
	
	
	
	
	
}
