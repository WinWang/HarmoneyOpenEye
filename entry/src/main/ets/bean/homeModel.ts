export interface homeModel {
    issueList: HomeModelIssueList[];
    itemList: HomeModelIssueList[];
    nextPageUrl: string;
    nextPublishTime: number;
    newestIssueType: string;
}

export interface HomeModelIssueListItemListData {
    dataType: string;
    id: number;
    title: string;
    description: string;
    image: string;
    actionUrl: string;
    shade: boolean;
    autoPlay: boolean;
    category: string;
    cover: CoverModel;
    playUrl: string;
    author: AuthorModel;
}

export interface HomeModelIssueListItemList {
    type?: string;
    data?: HomeModelIssueListItemListData;
    id?: number;
    adIndex?: number;
    bannerList?: HomeModelIssueListItemList[];
}

export interface HomeModelIssueList {
    releaseTime: number;
    type: string;
    date: number;
    publishTime: number;
    itemList: HomeModelIssueListItemList[];
    count: number;
}

export interface CoverModel {
    feed: string;
    detail: string;
    blurred: string;
    sharing?: any;
    homepage: string;
}

export interface AuthorModel {
    id: number;
    icon: string;
    name: string;
    description: string;
    link: string;
    latestReleaseTime: number;
    videoNum: number;
    adTrack?: any;
    follow: RootObjectFollow;
    shield: RootObjectShield;
    approvedNotReadyVideoCount: number;
    ifPgc: boolean;
    recSort: number;
    expert: boolean;
}

export interface RootObjectFollow {
    itemType: string;
    itemId: number;
    followed: boolean;
}

export interface RootObjectShield {
    itemType: string;
    itemId: number;
    shielded: boolean;
}




