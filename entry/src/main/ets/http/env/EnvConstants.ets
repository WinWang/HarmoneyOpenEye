// EnvConstants.ts  

// 直接使用 export 导出常量  
export const isBuildDebug: boolean = false;
export const isLogDebug: boolean = true;
export const channelString: string = "ch_wg_default"; // 通常我们使用驼峰命名法来命名变量和属性  

// 在其他文件中导入这些常量  
// import { isBuildDebug, isLogDebug, channelString } from './EnvConstants';