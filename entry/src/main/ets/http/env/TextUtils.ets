
export namespace TextUtils{
  export  function isEmpty(str: string | null | undefined): boolean {
    return str === null || str === undefined || str.trim() === '';
  }
}
