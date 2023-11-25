export interface TopicModel {
	itemList: TopicModelItemList[];
	count: number;
	total: number;
	nextPageUrl: string;
	adExist: boolean;
}
export interface TopicModelItemListDataLabel {
	text: string;
	card: string;
	detail?: any;
}
export interface TopicModelItemListData {
	dataType: string;
	id: number;
	title: string;
	description: string;
	image: string;
	actionUrl: string;
	adTrack: any[];
	shade: boolean;
	label: TopicModelItemListDataLabel;
	labelList: any[];
	header?: any;
	autoPlay: boolean;
}
export interface TopicModelItemList {
	type: string;
	data: TopicModelItemListData;
	trackingData?: any;
	tag?: any;
	id: number;
	adIndex: number;
}