/**
 * 测试的事件Event
 * @param testContent
 * @returns
 */
export function TestEvent(testContent: string) {
  return {
    data: {
      "testContent": testContent
    }
  }
}