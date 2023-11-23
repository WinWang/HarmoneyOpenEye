/**
 * 将图片链接的前面拼接上ali-的正则表达式
 * 例如：http://img.kaiyanapp.com/eef24aa10ab6cf17b5a512943ec22053.jpeg?imageMogr2/quality/60/format/jpg
 * 转换成：http://ali-img.kaiyanapp.com/eef24aa10ab6cf17b5a512943ec22053.jpeg?imageMogr2/quality/60/format/jpg
 */
const regex = /^(https?:\/\/)img\.(.*)$/
const replacement = "$1ali-img.$2"
const ImageRegexUtils = (imageUrl: string | undefined) => {
    if (imageUrl === undefined) return ""
    return imageUrl.replace(regex, replacement)
}

export default ImageRegexUtils