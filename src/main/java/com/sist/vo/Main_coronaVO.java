package com.sist.vo;

/*
 * CITY                  VARCHAR2(10) 
TOTAL_TODAY           VARCHAR2(20) 
DOMESTIC              VARCHAR2(20) 
OVERSEAS              VARCHAR2(20) 
TOTAL_COUNT           VARCHAR2(20) 
QUARANTINE            VARCHAR2(20) 
QUARANTINE_RELEASE    VARCHAR2(20) 
DYING                 VARCHAR2(20) 
INCIDENCE_RATE        VARCHAR2(20) 
 */
public class Main_coronaVO {
    private String city,totaltoday,domestic,overseas,totalcount,quarantine,quarantinerelease,dying,incidencerate;

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getTotaltoday() {
		return totaltoday;
	}

	public void setTotaltoday(String totaltoday) {
		this.totaltoday = totaltoday;
	}

	public String getDomestic() {
		return domestic;
	}

	public void setDomestic(String domestic) {
		this.domestic = domestic;
	}

	public String getOverseas() {
		return overseas;
	}

	public void setOverseas(String overseas) {
		this.overseas = overseas;
	}

	public String getTotalcount() {
		return totalcount;
	}

	public void setTotalcount(String totalcount) {
		this.totalcount = totalcount;
	}

	public String getQuarantine() {
		return quarantine;
	}

	public void setQuarantine(String quarantine) {
		this.quarantine = quarantine;
	}

	public String getQuarantinerelease() {
		return quarantinerelease;
	}

	public void setQuarantinerelease(String quarantinerelease) {
		this.quarantinerelease = quarantinerelease;
	}

	public String getDying() {
		return dying;
	}

	public void setDying(String dying) {
		this.dying = dying;
	}

	public String getIncidencerate() {
		return incidencerate;
	}

	public void setIncidencerate(String incidencerate) {
		this.incidencerate = incidencerate;
	}
}
