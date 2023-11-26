export interface TopicDetailModel {
    id?: number;
    headerImage?: string;
    brief?: string;
    text?: string;
    shareLink?: string;
    itemList?: TopicDetailModelItemList[];
    count?: number;
    adTrack?: any;
}

export interface TopicDetailModelItemListDataHeader {
    id: number;
    actionUrl: string;
    labelList?: any;
    icon: string;
    iconType: string;
    time: number;
    showHateVideo: boolean;
    followType: string;
    tagId: number;
    tagName?: any;
    issuerName: string;
    topShow: boolean;
}

export interface TopicDetailModelItemListDataContentDataTags {
    id: number;
    name: string;
    actionUrl: string;
    adTrack?: any;
    desc?: any;
    bgPicture: string;
    headerImage: string;
    tagRecType: string;
    childTagList?: any;
    childTagIdList?: any;
    haveReward: boolean;
    ifNewest: boolean;
    newestEndTime?: any;
    communityIndex: number;
}

export interface TopicDetailModelItemListDataContentDataConsumption {
    collectionCount: number;
    shareCount: number;
    replyCount: number;
    realCollectionCount: number;
}

export interface TopicDetailModelItemListDataContentDataProvider {
    name: string;
    alias: string;
    icon: string;
}

export interface TopicDetailModelItemListDataContentDataAuthorFollow {
    itemType: string;
    itemId: number;
    followed: boolean;
}

export interface TopicDetailModelItemListDataContentDataAuthorShield {
    itemType: string;
    itemId: number;
    shielded: boolean;
}

export interface TopicDetailModelItemListDataContentDataAuthor {
    id: number;
    icon: string;
    name: string;
    description: string;
    link: string;
    latestReleaseTime: number;
    videoNum: number;
    adTrack?: any;
    follow: TopicDetailModelItemListDataContentDataAuthorFollow;
    shield: TopicDetailModelItemListDataContentDataAuthorShield;
    approvedNotReadyVideoCount: number;
    ifPgc: boolean;
    recSort: number;
    expert: boolean;
}

export interface TopicDetailModelItemListDataContentDataCover {
    feed: string;
    detail: string;
    blurred: string;
    sharing?: any;
    homepage?: any;
}

export interface TopicDetailModelItemListDataContentDataWebUrl {
    raw: string;
    forWeibo: string;
}

export interface TopicDetailModelItemListDataContentDataPlayInfoUrlList {
    name: string;
    url: string;
    size: number;
}

export interface TopicDetailModelItemListDataContentDataPlayInfo {
    height: number;
    width: number;
    urlList: TopicDetailModelItemListDataContentDataPlayInfoUrlList[];
    name: string;
    type: string;
    url: string;
}

export interface TopicDetailModelItemListDataContentData {
    dataType: string;
    id: number;
    title: string;
    description: string;
    library: string;
    tags: TopicDetailModelItemListDataContentDataTags[];
    consumption: TopicDetailModelItemListDataContentDataConsumption;
    resourceType: string;
    slogan?: any;
    provider: TopicDetailModelItemListDataContentDataProvider;
    category: string;
    author: TopicDetailModelItemListDataContentDataAuthor;
    cover: TopicDetailModelItemListDataContentDataCover;
    playUrl: string;
    thumbPlayUrl?: any;
    duration: number;
    webUrl: TopicDetailModelItemListDataContentDataWebUrl;
    releaseTime: number;
    playInfo: TopicDetailModelItemListDataContentDataPlayInfo[];
    campaign?: any;
    waterMarks?: any;
    ad: boolean;
    adTrack: any[];
    type: string;
    titlePgc: string;
    descriptionPgc: string;
    remark: string;
    ifLimitVideo: boolean;
    searchWeight: number;
    brandWebsiteInfo?: any;
    videoPosterBean?: any;
    idx: number;
    shareAdTrack?: any;
    favoriteAdTrack?: any;
    webAdTrack?: any;
    date: number;
    promotion?: any;
    label?: any;
    labelList: any[];
    descriptionEditor: string;
    collected: boolean;
    reallyCollected: boolean;
    played: boolean;
    subtitles: any[];
    lastViewTime?: any;
    playlists?: any;
    src?: any;
    recallSource?: any;
    recall_source?: any;
}

export interface TopicDetailModelItemListDataContent {
    type: string;
    data: TopicDetailModelItemListDataContentData;
    trackingData?: any;
    tag?: any;
    id: number;
    adIndex: number;
}

export interface TopicDetailModelItemListData {
    dataType: string;
    header: TopicDetailModelItemListDataHeader;
    content: TopicDetailModelItemListDataContent;
    adTrack: any[];
}

export interface TopicDetailModelItemList {
    type: string;
    data: TopicDetailModelItemListData;
    trackingData?: any;
    tag?: any;
    id: number;
    adIndex: number;
}
