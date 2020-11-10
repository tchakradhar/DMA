import { Helmet } from 'react-helmet';
import brand from 'dan-api/dummy/brand';
import { PapperBlock } from 'dan-components';
import React,{useState}from 'react';
function SelectSchemas() {
   
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
      <PapperBlock title="Select Schemas" desc="">
        <div className="container" >
            <div className="row search-results">
               
                <p>SelectSchemas works</p>
                
                
            </div>
        </div>
      </PapperBlock>
    </div>
  );
}

export default SelectSchemas;
