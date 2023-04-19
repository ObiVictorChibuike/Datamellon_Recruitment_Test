
///Use cases for Api calls when it has a body
abstract class useCase<T, P> {
  Future<T> execute({required P params});
}
///Use cases for Api calls when it has a no body or parameter body
abstract class noParamUseCases<T> {
  Future<T> noParamCall();
}