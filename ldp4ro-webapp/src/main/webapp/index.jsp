<!DOCTYPE html>
<html lang="en">
<%@page contentType="text/html; charset=UTF-8" %>
  <!--
  /*
 * Copyright 2012-2013 Ontology Engineering Group, Universidad Politécnica de Madrid, Spain
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 * 
 * This page was created by Daniel Garijo, based on the following template:
 * http://www.dropzonejs.com/bootstrap.html
 */
  -->
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Simple RO upload test </title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/ro.css">
    <link href="https://oss.maxcdn.com/jquery.bootstrapvalidator/0.5.2/css/bootstrapValidator.min.css" rel="stylesheet"/>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet"/>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.3/js/bootstrapValidator.min.js"></script>
    
    <!--<script src="js/bootstrap.min.js"></script>-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/dropzone/3.12.0/dropzone.min.js"></script>
    <!--<script>
        //var Dropzone = require("enyo-dropzone");
        //Dropzone.autoDiscover = false;
    </script>-->

  </head>
   <body>

    <div class="container">
      <nav class="navbar navbar-inverse" role="navigation">
            <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
          <a class="navbar-brand" href="#">Create ROs!</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
          <ul class="nav navbar-nav">
		    <li><a href="roVisualizer.jsp">Browse ROs</a></li>
			<li><a href="search.html">Search ROs</a></li>
            <li><a href="about.html">About</a></li>            
          </ul>
        </div>
        </div>
      </nav>
      <div>        
        <h3 class="text-muted">Create your own Research Object</h3>
      </div>

      <div class="jumbotron">
        <h1 id="toremove">Drop your files here</h1>
        
        <div class="table table-striped files" id="previews">

            <div id="template" class="file-row">
              <!-- This is used as the file preview template -->
              <div>
                  <span class="preview"><img data-dz-thumbnail /></span>
              </div>
              <div>
                  <p class="name" data-dz-name></p>
                  <strong class="error text-danger" data-dz-errormessage></strong>
              </div>
              <div>
                  <p class="size" data-dz-size></p>
                  <div class="progress progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0">
                    <div class="progress-bar progress-bar-success" style="width:0%;" data-dz-uploadprogress></div>
                  </div>
              </div>
              <div>
                <button class="btn btn-primary start">
                    <i class="glyphicon glyphicon-upload"></i>
                    <span>Start</span>
                </button>
                <button data-dz-remove class="btn btn-warning cancel">
                    <i class="glyphicon glyphicon-ban-circle"></i>
                    <span>Cancel</span>
                </button>
                <button data-dz-remove class="btn btn-danger delete">
                  <i class="glyphicon glyphicon-trash"></i>
                  <span>Delete</span>
                </button>
              </div>
            </div>

          </div>
      </div>
    
    <div id="actions" class="row">

      <div class="col-lg-7">
        <!-- The fileinput-button span is used to style the file input field as button -->
        <span class="btn btn-success fileinput-button">
            <i class="glyphicon glyphicon-plus"></i>
            <span>Add files...</span>
        </span>
        <button type="submit" class="btn btn-primary start">
            <i class="glyphicon glyphicon-upload"></i>
            <span>Start upload</span>
        </button>
        <button type="reset" class="btn btn-warning cancel">
            <i class="glyphicon glyphicon-ban-circle"></i>
            <span>Cancel upload</span>
        </button>
      </div>
      <div class="col-lg-5">
        <!-- The global file processing state -->
       
          <div id="total-progress" class="progress progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0">
            <div class="progress-bar progress-bar-success" style="width:0%;" data-dz-uploadprogress></div>
          </div>    
        <!--</span>-->
      </div>

    </div>
	
	<div class="panel">
	  <div class="panel-body">	  
		  <form id="surveyForm" class="form-horizontal" role="form" action="form2rdf" method="post" accept-charset="UTF-8">
                    
                    <div class="form-group custom-no-margin">
                      <label for="abstract">Abstract</label>
                      <textarea rows="3" class="form-control" id="abstract" name="abstract" placeholder="Enter the abstract of your RO here"></textarea>
                    </div>
                      
                    <div class="form-group custom-no-margin">
                        <label class="col-sm-2 custom-left" for="Title" >Title</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="title" name="title" placeholder="Enter the title of your RO here">
                        </div> 
                    </div>
                      
                    <div class="form-group custom-no-margin">
                      <label>Creators (name and URI)</label>
                        <div class="form-group custom-no-margin">
                          <label for="creatorName" class="col-sm-2 control-label">Author name</label>
                          <div class="col-sm-8">
                            <input type="text" class="form-control" id="creatorName" name="creatorName[]" placeholder="Insert the creator full name here">
                          </div>
                        </div>

                        <div class="form-group custom-no-margin">
                            <label for="creatorURI" class="col-sm-2 control-label">Author URI</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="creatorURI"  name="creatorURI[]" placeholder="Insert the creator's URI here">
                            </div>
                            <div class="col-sm-2">
                                <button type="button" class="btn btn-default addCreatorURI"><i class="glyphicon glyphicon-plus"></i></button>
                            </div>
                        </div>

                    </div>
                      
                    <div class="form-group hide custom-no-margin" id="creatorURITemplate">
                        <div class="form-group custom-no-margin">
                          <label class="col-sm-2 control-label">Author name</label>
                          <div class="col-sm-8">
                            <input type="text" class="form-control"  name="creatorName[]" placeholder="Insert the creator full name here">
                          </div>                          
                        </div>  
                          
                        <div class="form-group custom-no-margin">
                            <label  class="col-sm-2 control-label">Author URI</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control"  name="creatorURI[]" placeholder="Insert the creator's URI here">
                            </div>
                            <div class="col-sm-2">
                                <button type="button" class="btn btn-default removeCreatorURI"><i class="fa fa-minus"></i></button>
                            </div>
                        </div>
                    </div>    

                      <div class="form-group custom-no-margin">
                          <label class="col-sm-2 custom-left" for="date">Creation date</label>
                          <div class="col-sm-8">
                              <input type="text" class="form-control" id="date" name="date" placeholder="Insert the date of creation here (YYYY/MM/DD)">
                          </div>
                      </div>

                      <div class="form-group custom-no-margin">
                          <label class="col-sm-2 custom-left">External URIs</label>
                          <div class="col-sm-8">
                              <input type="text" class="form-control"  id="externalURI" name="externalURI[]" placeholder="Insert a external resource to be aggregated here" />
                          </div>
                          <div class="col-sm-2">
                              <button type="button" class="btn btn-default addExternalURI"><i class="fa fa-plus"></i></button>
                              <!--<button type="button" class="btn btn-default addButton"><i class="glyphicon glyphicon-plus"></i></button>-->
                          </div>
                      </div>

                      <div class="form-group hide custom-no-margin" id="externalURITemplate">
                          <div class="col-sm-offset-2 col-sm-8">
                              <input class="form-control" type="text" name="externalURI[]" placeholder="Insert a external resource to be aggregated here"/>
                          </div>
                          <div class="col-sm-2">
                              <button type="button" class="btn btn-default removeExternalURI"><i class="fa fa-minus"></i></button>
                          </div>
                      </div>

                      <div class="form-group custom-no-margin">
                          <label class="col-sm-2 custom-left" for="license">License</label>
                          <div class="col-sm-8">

                              <select class="form-control" name="license" id="license">
                                  <option value="http://purl.org/NET/rdflicense/cc-by4.0">Creative Commons CC-BY 4.0</option>
                                  <option value="http://purl.org/NET/rdflicense/cc-by-nc4.0">Creative Commons CC-BY-NC 4.0</option>
                                  <option value="http://purl.org/NET/rdflicense/cc-by-nd4.0">Creative Commons CC-BY-ND 4.0</option>
                                  <option value="http://purl.org/NET/rdflicense/cc-by-sa4.0">Creative Commons CC-BY-SA 4.0</option>
                                  <option value="http://purl.org/NET/rdflicense/cc-by-nc-sa4.0">Creative Commons CC-BY-NC-SA 4.0</option>
                                  <option value="http://purl.org/NET/rdflicense/cc-by-nc-nd4.0">Creative Commons CC-BY-NC-ND 4.0</option>
                                  <option value="http://purl.org/NET/rdflicense/cc-zero1.0">Creative Commons CC0</option>
                                  <option value="http://purl.org/NET/rdflicense/ARTISTIC2.0">ARTISTIC LICENSE 2.0</option>
                                  <option value="http://purl.org/NET/rdflicense/CDDL1.0">COMMON DEVELOPMENT AND DISTRIBUTION LICENSE</option>
                                  <option value="http://purl.org/NET/rdflicense/APACHE2.0">APACHE LICENSE 2.0</option>
                                  <option value="http://purl.org/NET/rdflicense/GNU-LGPL3.0">GNU LESSER GENERAL PUBLIC LICENSE</option>
                              </select>

                              <!--input type="text" class="form-control" name="license" id="license" placeholder="Insert the URL of the license of the RO" -->
                          </div>
                      </div>

                      <div class="form-group custom-no-margin">
                          <div class="col-sm-offset-4 ">
                              <button type="submit" class="btn btn-default col-sm-4" id="buttonForm">Submit</button>
                          </div>
                      </div>
                  </form>
            </div>
	</div>

      <footer class="footer">
        <p>&copy; Ontology Engineering Group, 2014</p>
      </footer>

    </div> <!-- /container -->
   
  <script>
      // Get the template HTML and remove it from the document
      var previewNode = document.querySelector("#template");
      previewNode.id = "";
      var previewTemplate = previewNode.parentNode.innerHTML;
      previewNode.parentNode.removeChild(previewNode);
	  var uploadedFiles = [];

      var myDropzone = new Dropzone(document.body, { // Make the whole body a dropzone
       //url: "http://www.torrentplease.com/dropzone.php", // I leave this URL for testing
		url: "upload",
        thumbnailWidth: 80,
        thumbnailHeight: 80,
        parallelUploads: 20,
        previewTemplate: previewTemplate,
        autoQueue: false, // Make sure the files aren't queued until manually added
        previewsContainer: "#previews", // Define the container to display the previews
        clickable: ".fileinput-button" // Define the element that should be used as click trigger to select files.
      });

      myDropzone.on("addedfile", function(file) {
        // Hookup the start button
        file.previewElement.querySelector(".start").onclick = function() { myDropzone.enqueueFile(file); };
        //var element = document.getElementById("toremove");
        //element.parentNode.removeChild(element);
        $('#toremove').hide();
      });

      // Update the total progress bar
      myDropzone.on("totaluploadprogress", function(progress) {
        document.querySelector("#total-progress .progress-bar").style.width = progress + "%";
      });

      myDropzone.on("sending", function(file) {
        // Show the total progress bar when upload starts
        document.querySelector("#total-progress").style.opacity = "1";
        // And disable the start button
        file.previewElement.querySelector(".start").setAttribute("disabled", "disabled");
      });

      // Hide the total progress bar when nothing's uploading anymore
      myDropzone.on("queuecomplete", function(progress) {
        document.querySelector("#total-progress").style.opacity = "0";
      });
      
      //test for canceling the files
      myDropzone.on("removedfile", function(file) {
        /*alert("accepted"+myDropzone.getAcceptedFiles().length);
        alert("queued"+myDropzone.getQueuedFiles().length);
        alert("uploading"+myDropzone.getUploadingFiles().length);
        alert("active"+myDropzone.getActiveFiles().length);*/
        
        //if no other files, show the header
        if(myDropzone.getAcceptedFiles().length===0 &&
                myDropzone.getQueuedFiles().length===0 &&
                    myDropzone.getUploadingFiles().length===0){
                $('#toremove').show()
                
        }
      });
      
      //success: everything ok. Complete: wether ok or error
      myDropzone.on("success", function(file, responseText) {
        //alert("Response goes here: "+ responseText);
	//since the file has been accepted on the server, we save the response (which is the URI of the file)
        uploadedFiles.push(responseText);
      });

      // Setup the buttons for all transfers
      // The "add files" button doesn't need to be setup because the config
      // `clickable` has already been specified.
      document.querySelector("#actions .start").onclick = function() {
        myDropzone.enqueueFiles(myDropzone.getFilesWithStatus(Dropzone.ADDED));
      };
      document.querySelector("#actions .cancel").onclick = function() {
        myDropzone.removeAllFiles(true);
        $('#toremove').show();
      };
      
      document.querySelector("#buttonForm").onclick = function() {
	 //   var text="";
	  for (index = 0; index < uploadedFiles.length; index++) {
	//		text += uploadedFiles[index];

            // Adding the uploaded file URIs to the form
        $('<input />').attr('type', 'hidden')
                .attr('name', "resourceURI[]")
                .attr('value', uploadedFiles[index])
                .appendTo('#surveyForm');
      }
        //alert("Will have to check if the uploaded files have been accepted. The files are: "+text);

        //Removing the templates to avoid receiving empty values
        $('#creatorURITemplate').remove();
        $('#externalURITemplate').remove();
		
		
		//var aux = $('input').map(function(){
		//	return encodeURIComponent($( this ).val());
		//});
		
		//encode the values of the text in the form
/*		$('input').each(function(index, element){
			//console.log('before '+$('input')[index].value);
			if($('input')[index].name ==='title' || $('input')[index].name ==='creatorName[]'){
				$('input')[index].value = encodeURIComponent($('input')[index].value);//aux[index];
			}
			console.log('after '+$('input')[index].value);
		});
		$('textarea').each(function(index, element){
			$('textarea')[index].value = encodeURIComponent($('textarea')[index].value);
		});*/
		//console.log($('#surveyForm'));
		//console.log($('#surveyForm').find(':visible[name="creatorName[]"]')[0].value);
        //$("#surveyForm").submit();
		
      };
    </script>
    <script>
        

$(document).ready(function() {
	document.getElementById("date").value = new Date().toJSON().slice(0,10).replace(/-/g,'/');
    // The maximum number of options
    var MAX_OPTIONS = 20;

    $('#surveyForm')
        .bootstrapValidator({
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                'externalURI[]': {
                    validators: {
                        uri: {
                            message: 'The external URI is malformed'
                        }
                    }
                },
//                'creatorName[]': {
//                    validators: {
//                        notEmpty: {
//                            message: 'A creator URI is required and cannot be empty'
//                        },
//                        stringLength: {
//                            max: 100,
//                            message: 'The option must be less than 100 characters long'
//                        }
//                    }
//                },
                'creatorURI[]': {
                    validators: {
                        notEmpty: {
                            message: 'A creator URI is required and cannot be empty'
                        },
                        stringLength: {
                            max: 100,
                            message: 'The option must be less than 100 characters long'
                        },
                        uri: {
                            message: 'The creator URI is malformed'
                        }
                    }
                }, 'license': {
                    validators: {
                        uri: {
                            message: 'The license URI is malformed'
                        }
                    }
                }, 'title': {
                    validators: {
                        notEmpty: {
                            message: 'The title is required and cannot be empty'
                        }
                    }
                },'date': {
                    validators: {
                        date: {
                            format: 'YYYY/MM/DD',
                            message: 'The date is not valid. Please use the format YYYY/MM/DD'
                        }
                    }
                }
            }
        })

        // Add button click handler
        .on('click', '.addCreatorURI', function() {
            var $template = $('#creatorURITemplate'),
                $clone    = $template
                                .clone()
                                .removeClass('hide')
                                .removeAttr('id')
                                .insertBefore($template),
                $option   = $clone.find('[name="creatorURI[]"]');

            // Add new field
            $('#surveyForm').bootstrapValidator('addField', $option);
        })

        // Remove button click handler
        .on('click', '.removeCreatorURI', function() {
            var $row    = $(this).parents('.form-group'),
                $option = $row.find('[name="creatorURI[]"]');

            // Remove element containing the option
            $row.remove();

            // Remove field
            $('#surveyForm').bootstrapValidator('removeField', $option);
        })

        // Called after adding new field
        .on('added.field.bv', function(e, data) {
            // data.field   --> The field name
            // data.element --> The new field element
            // data.options --> The new field options

            if (data.field === 'creatorURI[]') {
                if ($('#surveyForm').find(':visible[name="creatorURI[]"]').length >= MAX_OPTIONS) {
                    $('#surveyForm').find('.addCreatorURI').attr('disabled', 'disabled');
                }
            } else if (data.field === 'externalURI[]') {
                if ($('#surveyForm').find(':visible[name="externalURI[]"]').length >= MAX_OPTIONS) {
                    $('#surveyForm').find('.addExternalURI').attr('disabled', 'disabled');
                }
            }
        })

        // Called after removing the field
        .on('removed.field.bv', function(e, data) {
           if (data.field === 'creatorURI[]') {
                if ($('#surveyForm').find(':visible[name="creatorURI[]"]').length < MAX_OPTIONS) {
                    $('#surveyForm').find('.addCreatorURI').removeAttr('disabled');
                }
            } else if (data.field === 'externalURI[]') {
               if ($('#surveyForm').find(':visible[name="externalURI[]"]').length < MAX_OPTIONS) {
                    $('#surveyForm').find('.addExternalURI').removeAttr('disabled');
                //$('#surveyForm').find('.addExternalURI').attr('disabled', 'disabled');
               }
           }
        })

        // Add button click handler
        .on('click', '.addExternalURI', function() {
            var $template = $('#externalURITemplate'),
                    $clone    = $template
                            .clone()
                            .removeClass('hide')
                            .removeAttr('id')
                            .insertBefore($template),
                    $option   = $clone.find('[name="externalURI[]"]');

            // Add new field
            $('#surveyForm').bootstrapValidator('addField', $option);
        })

        // Remove button click handler
        .on('click', '.removeExternalURI', function() {
            var $row    = $(this).parents('.form-group'),
                    $option = $row.find('[name="externalURI[]"]');

            // Remove element containing the option
            $row.remove();

            // Remove field
            $('#surveyForm').bootstrapValidator('removeField', $option);
        });


});


    </script>
  </body>
</html>