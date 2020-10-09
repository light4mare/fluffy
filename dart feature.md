//###继承、混入：
    混入类的方法可以被重写
    混入的类中如果有未实现的方法，在重写类中不会提示是重写方法，如果加了@override注解，会被要求参数完全一致

Q:
    为什么重写类中会有波浪线警告：This class (or a class that this class inherits from) is marked as '@immutable', but one or more of its instance fields aren't final: StatePageEx.bgColor, StatePageEx.vm


//#Future
await 可以直接对future进行拆箱

对于有await future 的方法，只要调用的地方不再次调用await，就可以跳过这个耗时操作，先往下执行
方法 不需要return语句

flutter packages pub run build_runner build
flutter packages pub run build_runner watch

taskkill /im dart.exe /f

#flutter packages pub run build_runner build lib