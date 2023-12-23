type EventHandler<T> = (data: T) => void;

export default class EventBus {
  private static instance: EventBus;
  private listeners: Record<string, EventHandler<any>[]> = {};

  private constructor() {
  }

  public static getInstance(): EventBus {
    if (!EventBus.instance) {
      EventBus.instance = new EventBus();
    }
    return EventBus.instance;
  }

  public on<T>(eventName: string, handler: EventHandler<T>): void {
    if (!this.listeners[eventName]) {
      this.listeners[eventName] = [];
    }
    this.listeners[eventName].push(handler);
  }

  public off<T>(eventName: string, handler: EventHandler<T>): void {
    const eventHandlers = this.listeners[eventName];
    if (eventHandlers) {
      this.listeners[eventName] = eventHandlers.filter((h) => h !== handler);
    }
  }

  public emit<T>(eventName: string, data: T): void {
    const eventHandlers = this.listeners[eventName];
    if (eventHandlers) {
      eventHandlers.forEach((handler) => {
        handler(data);
      });
    }
  }
}


// // 使用示例
// const eventBus = EventBus.getInstance();
//
// // 注册事件处理程序
// eventBus.on<string>("userLoggedIn", (username) => {
//   console.log(`User ${username} logged in`);
// });
//
// // 发送事件
// eventBus.emit("userLoggedIn", "JohnDoe");
//
// // 反注册事件处理程序
// const handler = (data: string) => {
//   console.log(`Handler for userLoggedIn event: ${data}`);
// };
// eventBus.on("userLoggedIn", handler);
// eventBus.off("userLoggedIn", handler);
