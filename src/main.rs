use std::env::var_os;
use warp::{http::Response, Filter};

#[tokio::main]
async fn main() {
  warp::serve(warp::any().map(|| {
    Response::builder().body(match var_os("RESPONSE_TEXT") {
      Some(v) => v.into_string().unwrap(),
      None => "Hello from Http Echo".to_owned(),
    })
  }))
  .run(([0, 0, 0, 0], 8080))
  .await;
}
