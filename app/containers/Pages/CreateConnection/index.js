import React,{useState}from 'react';
import { Helmet } from 'react-helmet';
import brand from 'dan-api/dummy/brand';
import { PapperBlock } from 'dan-components';
import ReactDOM from 'react-dom';


function CreateConnection() {
 
  const title = brand.name + ' - Dashboard';
  const description = brand.desc;
//  const[name,SetName]=useState('')
//  const[email,SetEmail]=useState('')
 let [formData, setAccount] = useState({
  connectionName: '',
  hostName: '',
  dataName: '',
  userName: '',
  type: '',
  port: '',
  password: ''
});

let handleChange = (e) => {
  let name = e.target.name;
  let value = e.target.value;
  formData[name] = value;
  setAccount(formData);
}
let onSubmit = (e) => {
  e.preventDefault();
  console.log(formData);
}



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
      <PapperBlock title="Create New Connection  " desc="">
      <div>
      {/* <form className="form " onSubmit={onSubmit}>
                <div className="form-group row">
                    <label htmlFor="" className="control-label col-md-3">
                        Name
                    </label>
                    <div className="col-md-5">
                        <input name="name"   onChange={handleChange}  type="text" className="form-control"/>
                    </div>
                </div> 
                <div className="form-group row">
                    <label htmlFor="" className="control-label col-md-3">Email</label>
                    <div className="form-group col-md-5">
                        <input name="email"   onChange={handleChange} type="text" className="form-control"/>
                    </div>
                </div>
                <button type="submit" className="btn btn-primary mr-3">Submit</button>
                <button type="reset" className="btn btn-primary">Cancel</button>
                
            </form> */}
            <form onSubmit={onSubmit} className="form ">
              <div className="row">
                <div className="col-6">
                    <div class="form-group">
                      <label for="exampleInputEmail1">Connection Name</label>
                      <input type="text" class="form-control" id="" aria-describedby="emailHelp" placeholder="Enter Connection Name" name="connectionName"  onChange={handleChange}/>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputEmail1">Host Name</label>
                      <input type="text" class="form-control" id="" aria-describedby="emailHelp" placeholder="Enter Host Name" name="hostName"  onChange={handleChange}/>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputEmail1">Database Name</label>
                      <input type="text" class="form-control" id="" aria-describedby="emailHelp" placeholder="Enter Database Name" name="dataName"  onChange={handleChange}/>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputEmail1">User Name</label>
                      <input type="text" class="form-control" id="" aria-describedby="emailHelp" placeholder="Enter User Name" name="userName"  onChange={handleChange}/>
                    </div>
                </div>
                <div className="col-6">
                  <div class="form-group">
                      <label for="exampleFormControlSelect1">Select Type</label>
                      <select class="form-control" id="exampleFormControlSelect1"  onChange={handleChange} name="type">
                        <option>Amazon RedShift</option>
                        <option>Oracle</option>
                        <option>MS SQL Server</option>
                        <option>MySQL</option>
                        <option>Snow Flake</option>
                      </select>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputEmail1">Port </label>
                      <input type="text" class="form-control" id="" aria-describedby="emailHelp" placeholder="Enter Port" name="port"  onChange={handleChange}/>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Password</label>
                        <input type="password" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Password"  onChange={handleChange} name="password"/>
                    </div>
                    <div class="form-group ">
                      <button type="submit" className="btn btn-primary mr-3 mt-4">Submit</button>
                      <button type="reset" className="btn btn-primary mt-4">Cancel</button>
                    </div>
                   
                </div>
              </div>
            </form>
 
      </div>
      </PapperBlock>
     
    </div>
  );
}

export default CreateConnection;
