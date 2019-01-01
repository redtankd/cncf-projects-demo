#![feature(proc_macro_hygiene, decl_macro)]

use lazy_static::lazy_static;
use rocket::get;
use rocket::response::content;
use rocket::routes;
use std::env::var;

lazy_static! {
    static ref URL: String = format!(
        "http://{}:{}/hello/{}",
        var("HELLO_SUB_SERVICE_HOST").unwrap(),
        var("HELLO_SUB_SERVICE_PORT").unwrap(),
        &hostname::get_hostname().unwrap()
    );
}

#[get("/<name>/<age>")]
fn hello(name: String, age: u8) -> content::Html<String> {
    let hello = format!("Hello, {} year old named {}!", age, name);

    content::Html(
        hello + "<br/><br/>" + reqwest::get(URL.as_str()).unwrap().text().unwrap().as_str(),
    )
}

fn main() {
    println!("\nThe url for hello-sub-service is [{}]", *URL);
    rocket::ignite().mount("/hello", routes![hello]).launch();
}
