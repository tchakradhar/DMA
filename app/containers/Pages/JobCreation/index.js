import React from 'react';
import { Helmet } from 'react-helmet';
import brand from 'dan-api/dummy/brand';
import { PapperBlock } from 'dan-components';

function JobCreation() {
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
      <PapperBlock title="Job Creation " desc="">
      <div className="row">
          <div className="container">
          <div className="col-3"></div>
            <div className="col-5">
            <form>
                <div className="form-group">
                  <label for="exampleInputEmail1">Name</label>
                  <input type="text" className="form-control" id="" aria-describedby="emailHelp" name="name"/>
                
                </div>
                <button type="submit" className="btn btn-primary">Submit</button>
            </form>
            </div>
            <div className="col-3"></div>
          </div>
     
      </div>
      </PapperBlock>
     
    </div>
  );
}

export default JobCreation;
