import React from 'react';
import { Helmet } from 'react-helmet';
import brand from 'dan-api/dummy/brand';
import { PapperBlock } from 'dan-components';

function BlankPage() {
  const title = brand.name + ' - Dashboard';
  const description = brand.desc;
  return (
    <div>
      <Helmet>
        <title>{title}</title>
        <meta name="description" content={description} />
        <meta property="og:title" content={title} />
        <meta property="og:description" content={description} />
        <meta property="twitter:title" content={title} />
        <meta property="twitter:description" content={description} />
      </Helmet>
      <PapperBlock title="Dashboard " desc="">
        <div className="container" style={{backgroundColor:'none'}}>
            <div className="row">
                <div className="col-4 ">
                  <div className="row">
                  <a href="/app/connection">  <div className="card card1"  >
                        {/* <img className="card-img-top" src="images/1.png" alt="Card image cap"/> */}
                        <div className="card-body">
                          <h6 className="card-text text-center">Create Connection</h6>
                        </div>
                    </div></a>
                  </div>
                
                </div>
                <div className="col-4 ">
                <div className="row">
                <a href="/app/configuration"> <div className="card card2" >
                        {/* <img className="card-img-top" src="images/1.png" alt="Card image cap"/> */}
                        <div className="card-body">
                          <h6 className="card-text text-center">Configuration</h6>
                        </div>
                    </div></a>
                </div>
                </div>
                <div className="col-4 ">
                <div className="row">
                <a href="/app/job-creation"> <div className="card card3">
                        {/* <img className="card-img-top" src="images/1.png" alt="Card image cap"/> */}
                        <div className="card-body">
                          <h6 className="card-text text-center">Create Job</h6>
                        </div>
                    </div></a>
                </div>
                </div>
            </div>
        </div>
      </PapperBlock>
    </div>
  );
}

export default BlankPage;
