
class Info {
  List<Member> member;
  ResponseInfo responseInfo;
  String href;

  Info({this.member, this.responseInfo, this.href});

  Info.fromJson(Map<String, dynamic> json) {
    if (json['member'] != null) {
      member = new List<Member>();
      json['member'].forEach((v) {
        member.add(new Member.fromJson(v));
      });
    }
    responseInfo = json['responseInfo'] != null
        ? new ResponseInfo.fromJson(json['responseInfo'])
        : null;
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.member != null) {
      data['member'] = this.member.map((v) => v.toJson()).toList();
    }
    if (this.responseInfo != null) {
      data['responseInfo'] = this.responseInfo.toJson();
    }
    data['href'] = this.href;
    return data;
  }
}

class Member {
  String jobtaskCollectionref;
  String maxuserCollectionref;
  String locationsCollectionref;
  String wonum;
  String rsDocAttachmentsCollectionref;
  String targstartdate;
  String wpmaterialCollectionref;
  String sRowstamp;
  String srCollectionref;
  String personCollectionref;
  String description;
  String checklistwoCollectionref;
  String assetCollectionref;
  String siteCollectionref;
  String worktype;
  String worklogCollectionref;
  String href;
  String targcompdate;

  Member(
      {this.jobtaskCollectionref,
        this.maxuserCollectionref,
        this.locationsCollectionref,
        this.wonum,
        this.rsDocAttachmentsCollectionref,
        this.targstartdate,
        this.wpmaterialCollectionref,
        this.sRowstamp,
        this.srCollectionref,
        this.personCollectionref,
        this.description,
        this.checklistwoCollectionref,
        this.assetCollectionref,
        this.siteCollectionref,
        this.worktype,
        this.worklogCollectionref,
        this.href,
        this.targcompdate});

  Member.fromJson(Map<String, dynamic> json) {
    jobtaskCollectionref = json['jobtask_collectionref'];
    maxuserCollectionref = json['maxuser_collectionref'];
    locationsCollectionref = json['locations_collectionref'];
    wonum = json['wonum'];
    rsDocAttachmentsCollectionref = json['rs_doc_attachments_collectionref'];
    targstartdate = json['targstartdate'];
    wpmaterialCollectionref = json['wpmaterial_collectionref'];
    sRowstamp = json['_rowstamp'];
    srCollectionref = json['sr_collectionref'];
    personCollectionref = json['person_collectionref'];
    description = json['description'];
    checklistwoCollectionref = json['checklistwo_collectionref'];
    assetCollectionref = json['asset_collectionref'];
    siteCollectionref = json['site_collectionref'];
    worktype = json['worktype'];
    worklogCollectionref = json['worklog_collectionref'];
    href = json['href'];
    targcompdate = json['targcompdate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['jobtask_collectionref'] = this.jobtaskCollectionref;
    data['maxuser_collectionref'] = this.maxuserCollectionref;
    data['locations_collectionref'] = this.locationsCollectionref;
    data['wonum'] = this.wonum;
    data['rs_doc_attachments_collectionref'] =
        this.rsDocAttachmentsCollectionref;
    data['targstartdate'] = this.targstartdate;
    data['wpmaterial_collectionref'] = this.wpmaterialCollectionref;
    data['_rowstamp'] = this.sRowstamp;
    data['sr_collectionref'] = this.srCollectionref;
    data['person_collectionref'] = this.personCollectionref;
    data['description'] = this.description;
    data['checklistwo_collectionref'] = this.checklistwoCollectionref;
    data['asset_collectionref'] = this.assetCollectionref;
    data['site_collectionref'] = this.siteCollectionref;
    data['worktype'] = this.worktype;
    data['worklog_collectionref'] = this.worklogCollectionref;
    data['href'] = this.href;
    data['targcompdate'] = this.targcompdate;
    return data;
  }
}

class ResponseInfo {
  int totalCount;
  String href;

  ResponseInfo({this.totalCount, this.href});

  ResponseInfo.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalCount'] = this.totalCount;
    data['href'] = this.href;
    return data;
  }
}