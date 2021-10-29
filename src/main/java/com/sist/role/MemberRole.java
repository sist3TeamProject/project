package com.sist.role;

public enum MemberRole {
	
    ADMIN("ROLE_ADMIN"),
    USER("ROLE_USER");

	MemberRole(String value) {
		this.value = value;
	}
	  

    private String value;
    public String getValue() {
    	return this.value;
    }
}
