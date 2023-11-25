export interface FocusModel {
	itemList: FocusModelItemList[];
	count: number;
	total: number;
	nextPageUrl: string;
	adExist: boolean;
	updateTime?: any;
	refreshCount: number;
	lastStartId: number;
}
export interface FocusModelItemListDataHeaderFollow {
	itemType: string;
	itemId: number;
	followed: boolean;
}
export interface FocusModelItemListDataHeader {
	id: number;
	icon: string;
	iconType: string;
	title: string;
	subTitle?: any;
	description: string;
	actionUrl: string;
	adTrack?: any;
	follow: FocusModelItemListDataHeaderFollow;
	ifPgc: boolean;
	uid: number;
	ifShowNotificationIcon: boolean;
	expert: boolean;
}
export interface FocusModelItemListDataItemListDataTags {
	id: number;
	name: string;
	actionUrl: string;
	adTrack?: any;
	desc: string;
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
export interface FocusModelItemListDataItemListDataConsumption {
	collectionCount: number;
	shareCount: number;
	replyCount: number;
	realCollectionCount: number;
}
export interface FocusModelItemListDataItemListDataProvider {
	name: string;
	alias: string;
	icon: string;
}
export interface FocusModelItemListDataItemListDataAuthorFollow {
	itemType: string;
	itemId: number;
	followed: boolean;
}
export interface FocusModelItemListDataItemListDataAuthorShield {
	itemType: string;
	itemId: number;
	shielded: boolean;
}
export interface FocusModelItemListDataItemListDataAuthor {
	id: number;
	icon: string;
	name: string;
	description: string;
	link: string;
	latestReleaseTime: number;
	videoNum: number;
	adTrack?: any;
	follow: FocusModelItemListDataItemListDataAuthorFollow;
	shield: FocusModelItemListDataItemListDataAuthorShield;
	approvedNotReadyVideoCount: number;
	ifPgc: boolean;
	recSort: number;
	expert: boolean;
}
export interface FocusModelItemListDataItemListDataCover {
	feed: string;
	detail: string;
	blurred: string;
	sharing?: any;
	homepage?: any;
}
export interface FocusModelItemListDataItemListDataWebUrl {
	raw: string;
	forWeibo: string;
}
export interface FocusModelItemListDataItemListDataPlayInfoUrlList {
	name: string;
	url: string;
	size: number;
}
export interface FocusModelItemListDataItemListDataPlayInfo {
	height: number;
	width: number;
	urlList: FocusModelItemListDataItemListDataPlayInfoUrlList[];
	name: string;
	type: string;
	url: string;
}
export interface FocusModelItemListDataItemListDataVideoPosterBean {
	scale: number;
	url: string;
	fileSizeStr: string;
}
export interface FocusModelItemListDataItemListData {
	dataType: string;
	id: number;
	title: string;
	description: string;
	library: string;
	tags: FocusModelItemListDataItemListDataTags[];
	consumption: FocusModelItemListDataItemListDataConsumption;
	resourceType: string;
	slogan?: any;
	provider: FocusModelItemListDataItemListDataProvider;
	category: string;
	author: FocusModelItemListDataItemListDataAuthor;
	cover: FocusModelItemListDataItemListDataCover;
	playUrl: string;
	thumbPlayUrl?: any;
	duration: number;
	webUrl: FocusModelItemListDataItemListDataWebUrl;
	releaseTime: number;
	playInfo: FocusModelItemListDataItemListDataPlayInfo[];
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
	videoPosterBean: FocusModelItemListDataItemListDataVideoPosterBean;
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
export interface FocusModelItemListDataItemList {
	type: string;
	data: FocusModelItemListDataItemListData;
	trackingData?: any;
	tag?: any;
	id: number;
	adIndex: number;
}
export interface FocusModelItemListData {
	dataType: string;
	header: FocusModelItemListDataHeader;
	itemList: FocusModelItemListDataItemList[];
	count: number;
	adTrack?: any;
	footer?: any;
}
export interface FocusModelItemList {
	type: string;
	data: FocusModelItemListData;
	trackingData?: any;
	tag?: any;
	id: number;
	adIndex: number;
}