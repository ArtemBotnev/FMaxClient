
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


/// Member detail

class MemberDetail {
  String href;
  String description;
  String targstartdate;
  String targcompdate;
  String site;
  String wonum;
  String siteid;
  List<CheckLists> checkLists;

  MemberDetail(
      {this.href,
        this.description,
        this.targstartdate,
        this.targcompdate,
        this.site,
        this.wonum,
        this.siteid,
        this.checkLists});

  MemberDetail.fromJson(Map<String, dynamic> json) {
    href = json['href'];
    description = json['description'];
    targstartdate = json['targstartdate'];
    targcompdate = json['targcompdate'];
    site = json['site'];
    wonum = json['wonum'];
    siteid = json['siteid'];
    if (json['checkLists'] != null) {
      checkLists = new List<CheckLists>();
      json['checkLists'].forEach((v) {
        checkLists.add(new CheckLists.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    data['description'] = this.description;
    data['targstartdate'] = this.targstartdate;
    data['targcompdate'] = this.targcompdate;
    data['site'] = this.site;
    data['wonum'] = this.wonum;
    data['siteid'] = this.siteid;
    if (this.checkLists != null) {
      data['checkLists'] = this.checkLists.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CheckLists {
  int checklistwoid;
  String siteid;
  bool checked;
  String jpnum;
  String description;
  int parentid;
  int checklistoperationid;
  int countlevel;
  String href;
  String number;
  String chliststatus;
  String parentWonum;
  String goal;
  bool fixed;
  List<CheckLists> checkLists;
  String classid;
  String ansesstorClassId;
  List<String> rsDefectcomment;
  List<String> photoLinks;
  List<String> photoFileNames;
  bool scanned;
  List<String> locations;
  String checkedtimems;
  String photoNames;
  String checklistType;
  int checklistWoId;
  String checklistNumber;
  int checklistOperationId;

  CheckLists(
      {this.checklistwoid,
        this.siteid,
        this.checked,
        this.jpnum,
        this.description,
        this.parentid,
        this.checklistoperationid,
        this.countlevel,
        this.href,
        this.number,
        this.chliststatus,
        this.parentWonum,
        this.goal,
        this.fixed,
        this.checkLists,
        this.classid,
        this.ansesstorClassId,
        this.rsDefectcomment,
        this.photoLinks,
        this.photoFileNames,
        this.scanned,
        this.locations,
        this.checkedtimems,
        this.photoNames,
        this.checklistType,
        this.checklistWoId,
        this.checklistNumber,
        this.checklistOperationId});

  CheckLists.fromJson(Map<String, dynamic> json) {
    checklistwoid = json['checklistwoid'];
    siteid = json['siteid'];
    checked = json['checked'];
    jpnum = json['jpnum'];
    description = json['description'];
    parentid = json['parentid'];
    checklistoperationid = json['checklistoperationid'];
    countlevel = json['countlevel'];
    href = json['href'];
    number = json['number'];
    chliststatus = json['chliststatus'];
    parentWonum = json['parentWonum'];
    goal = json['goal'];
    fixed = json['fixed'];
    if (json['checkLists'] != null) {
      checkLists = new List<CheckLists>();
      json['checkLists'].forEach((v) {
        checkLists.add(new CheckLists.fromJson(v));
      });
    }
    classid = json['classid'];
    ansesstorClassId = json['ansesstorClassId'];
    if (json['rs_defectcomment'] != null) {
      rsDefectcomment = new List<Object>();
      json['rs_defectcomment'].forEach((v) {
        rsDefectcomment.add(v);
      });
    }
    if (json['photoLinks'] != null) {
      photoLinks = new List<String>();
      json['photoLinks'].forEach((v) {
        photoLinks.add(v);
      });
    }
    if (json['photoFileNames'] != null) {
      photoFileNames = new List<String>();
      json['photoFileNames'].forEach((v) {
        photoFileNames.add(v);
      });
    }
    scanned = json['scanned'];
    if (json['locations'] != null) {
      locations = new List<String>();
      json['locations'].forEach((v) {
        locations.add(v);
      });
    }
    checkedtimems = json['checkedtimems'];
    photoNames = json['photoNames'];
    checklistType = json['checklistType'];
    checklistWoId = json['checklistWoId'];
    checklistNumber = json['checklistNumber'];
    checklistOperationId = json['checklistOperationId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['checklistwoid'] = this.checklistwoid;
    data['siteid'] = this.siteid;
    data['checked'] = this.checked;
    data['jpnum'] = this.jpnum;
    data['description'] = this.description;
    data['parentid'] = this.parentid;
    data['checklistoperationid'] = this.checklistoperationid;
    data['countlevel'] = this.countlevel;
    data['href'] = this.href;
    data['number'] = this.number;
    data['chliststatus'] = this.chliststatus;
    data['parentWonum'] = this.parentWonum;
    data['goal'] = this.goal;
    data['fixed'] = this.fixed;
    if (this.checkLists != null) {
      data['checkLists'] = this.checkLists.map((v) => v.toJson()).toList();
    }
    data['classid'] = this.classid;
    data['ansesstorClassId'] = this.ansesstorClassId;
    if (this.rsDefectcomment != null) {
      data['rs_defectcomment'] =
          this.rsDefectcomment.map((v) => v).toList();
    }
    if (this.photoLinks != null) {
      data['photoLinks'] = this.photoLinks.map((v) => v).toList();
    }
    if (this.photoFileNames != null) {
      data['photoFileNames'] =
          this.photoFileNames.map((v) => v).toList();
    }
    data['scanned'] = this.scanned;
    if (this.locations != null) {
      data['locations'] = this.locations.map((v) => v).toList();
    }
    data['checkedtimems'] = this.checkedtimems;
    data['photoNames'] = this.photoNames;
    data['checklistType'] = this.checklistType;
    data['checklistWoId'] = this.checklistWoId;
    data['checklistNumber'] = this.checklistNumber;
    data['checklistOperationId'] = this.checklistOperationId;
    return data;
  }
}