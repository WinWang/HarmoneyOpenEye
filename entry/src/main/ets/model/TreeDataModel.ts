export interface TreeDataModel {
	data: TreeDataModelData[];
	errorCode: number;
	errorMsg: string;
}
export interface TreeDataModelData {
	articleList: any[];
	author: string;
	children: any[];
	courseId: number;
	cover: string;
	desc: string;
	id: number;
	lisense: string;
	lisenseLink: string;
	name: string;
	order: number;
	parentChapterId: number;
	type: number;
	userControlSetTop: boolean;
	visible: number;
}