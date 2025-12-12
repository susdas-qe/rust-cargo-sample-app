use axum::http::StatusCode;
use axum::Router;
use axum::routing::get;
use tokio::time::Instant;

async fn get_current_instance() -> (StatusCode, String) {
    let formatted_string = format!("Hello World {:?}\n", Instant::now().to_owned());
    (StatusCode::OK, formatted_string)
} 

#[tokio::main]
async fn main() {
    let app = Router::new()
     .route("/time", get(get_current_instance));
    println!("Listening...");
    let listener = tokio::net::TcpListener::bind("0.0.0.0:3000").await.unwrap();
    axum::serve(listener, app).await.unwrap();
}
