import React, { memo, useEffect, useState } from "react";
import { Block, Container } from "./components";
import axios from "axios";


//const HomePage = ({ global: { plugins }, history: { push } }) => {
//  const initialed = [{ name: "Beaulieu" }, { name: "Folies Burgers" }];
//  var companies = [];
//  async function get() {
//    await axios
//      .get("https://plumstreet-bk.amagumolabs.net/companies")
//      .then((res) => {
//        companies = res.data;
//        console.log(companies);
//      })
//      .catch((err) => {
//        console.log(err);
//      });
//  }
//  get();
//  console.log("final", companies);
//  return (
//    <>
//      <Container className="container-fluid">
//        <div className="row">
//          <div className="col-12">
//            <Block>List of companies</Block>
//            {companies.length > 0 ? (
//              <Block>
//                {companies.map(function (com, i) {
//                  return <li key={i}>{com.name}</li>;
//                })}
//              </Block>
//            ) : (
//              <Block>
//                <p>
//                  {/*{initialed.map(function (com, i) {
//                    return <li key={i}>{com.name}</li>;
//                  })}*/}
//                  empty list
//                </p>
//              </Block>
//            )}
//          </div>
//        </div>
//      </Container>
//    </>
//  );
//};

//export default memo(HomePage);

class HomePage extends React.Component {
    constructor(props) {
        super(props);
        this.state = { companies: '' }
    }
    componentDidMount() {
        this.getdata()
    }
    getdata = async() => {
    await axios
              .get("https://plumstreet-bk.amagumolabs.net/companies")
              .then((res) => {
                this.setState({ companies: res.data})
              })
              .catch((err) => {
                console.log(err);
              });
          }
    render() {
      return ( 
      <div className="row">
        <div className="col-12">
          <Block>List of companies</Block>
          {this.state.companies?.length > 0 ? (
            <Block>
              {this.state.companies.map(function (com, i) {
                return <li key={i}>{com.name}</li>;
              })}
            </Block>
          ) : (
            <Block>
              <p>
                {/*{initialed.map(function (com, i) {
                  return <li key={i}>{com.name}</li>;
                })}*/}
                empty list
              </p>
            </Block>
          )}
        </div>
      </div>)
      
    }
  }

export default HomePage
