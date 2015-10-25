<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div id="addPatientsModal"
     class="modal hide fade in centering insertAndUpdateDialogs"
     role="dialog"
     aria-labelledby="addPatientsModalLabel"
     aria-hidden="true">
    <div class="modal-header">
        <h3 id="addPatientsModalLabel" class="displayInLine">
            <spring:message code="create"/>&nbsp;<spring:message code="patient"/>
        </h3>
    </div>
    <div class="modal-body">
        <form name="newPatientForm" novalidate >
            <div class="pull-left">
                <div>
                    <div class="input-append">
                        <label>* <spring:message code="patients.name"/>:</label>
                    </div>
                    <div class="input-append">
                        <input type="text"
                               required
                               autofocus
                               ng-model="patient.name"
                               name="name"
                               placeholder="<spring:message code='patient'/>&nbsp;<spring:message code='patients.name'/>"/>
                    </div>
                    <div class="input-append">
                        <label>
                                <span class="alert alert-error"
                                      ng-show="displayValidationError && newPatientForm.name.$error.required">
                                        <spring:message code="required"/>
                                </span>
                        </label>
                    </div>
                </div>
                <div>
                    <div class="input-append">
                        <label>* <spring:message code="patients.email"/>:</label>
                    </div>
                    <div class="input-append">
                        <input type="text"
                               required
                               ng-model="patient.email"
                               name="email"
                               placeholder="<spring:message code='sample.email'/> "/>
                    </div>
                    <div class="input-append">
                        <label>
                                <span class="alert alert-error"
                                      ng-show="displayValidationError && newPatientForm.email.$error.required">
                                    <spring:message code="required"/>
                                </span>
                        </label>
                    </div>
                </div>
                <div>
                    <div class="input-append">
                        <label>* <spring:message code="patients.mobilephone"/>:</label>
                    </div>
                    <div class="input-append">
                        <input type="text"
                               required
                               ng-model="patient.mobilephone"
                               name="mobilephone"
                               placeholder="<spring:message code='sample.phone'/> "/>
                    </div>
                    <div class="input-append">
                        <label>
                                <span class="alert alert-error"
                                      ng-show="displayValidationError && newPatientForm.mobilephone.$error.required">
                                    <spring:message code="required"/>
                                </span>
                        </label>
                    </div>
                </div>
                <div>
                    <div class="input-append">
                        <label>* <spring:message code="patients.dob"/>:</label>
                    </div>
                    <div class="input-append">
                        <input type="text"
                               required
                               ng-model="patient.dob"
                               name="dob"
                               placeholder="<spring:message code='sample.dob'/> "/>
                    </div>
                    <div class="input-append">
                        <label>
                                <span class="alert alert-error"
                                      ng-show="displayValidationError && newPatientForm.dob.$error.required">
                                    <spring:message code="required"/>
                                </span>
                        </label>
                    </div>
                </div>
                <div>
                    <div class="input-append">
                        <label>* <spring:message code="patients.zipcode"/>:</label>
                    </div>
                    <div class="input-append">
                        <input type="text"
                               required
                               ng-model="patient.zipcode"
                               name="zipcode"/>
                    </div>
                    <div class="input-append">
                        <label>
                                <span class="alert alert-error"
                                      ng-show="displayValidationError && newPatientForm.zipcode.$error.required">
                                    <spring:message code="required"/>
                                </span>
                        </label>
                    </div>
                </div>
                <input type="submit"
                       class="btn btn-inverse"
                       ng-click="createPatient(newPatientForm);"
                       value='<spring:message code="create"/>'/>
                <button class="btn btn-inverse"
                        data-dismiss="modal"
                        ng-click="exit('#addPatientsModal');"
                        aria-hidden="true">
                    <spring:message code="cancel"/>
                </button>
            </div>
        </form>
    </div>
    <span class="alert alert-error dialogErrorMessage"
          ng-show="errorOnSubmit">
        <spring:message code="request.error"/>
    </span>
</div>

<div id="updatePatientsModal"
     class="modal hide fade in centering insertAndUpdateDialogs"
     role="dialog"
     aria-labelledby="updatePatientsModalLabel"
     aria-hidden="true">
    <div class="modal-header">
        <h3 id="updatePatientsModalLabel" class="displayInLine">
            <spring:message code="update"/>&nbsp;<spring:message code="patient"/>
        </h3>
    </div>
    <div class="modal-body">
        <form name="updatePatientForm" novalidate>
            <input type="hidden"
                   required
                   ng-model="patient.id"
                   name="id"
                   value="{{patient.id}}"/>

            <div class="pull-left">
                <div>
                    <div class="input-append">
                        <label>* <spring:message code="patients.name"/>:</label>
                    </div>
                    <div class="input-append">
                        <input type="text"
                               autofocus
                               required
                               ng-model="patient.name"
                               name="name"
                               placeholder="<spring:message code='patient'/>&nbsp;<spring:message code='patients.name'/> "/>
                    </div>
                    <div class="input-append">
                        <label>
                                <span class="alert alert-error"
                                      ng-show="displayValidationError && updatePatientForm.name.$error.required">
                                    <spring:message code="required"/>
                                </span>
                        </label>
                    </div>
                </div>
                <div>
                    <div class="input-append">
                        <label>* <spring:message code="patients.email"/>:</label>
                    </div>
                    <div class="input-append">
                        <input type="text"
                               required
                               ng-model="patient.email"
                               name="email"
                               placeholder="<spring:message code='sample.email'/> "/>
                    </div>
                    <div class="input-append">
                        <label>
                                <span class="alert alert-error"
                                      ng-show="displayValidationError && updatePatientForm.email.$error.required">
                                    <spring:message code="required"/>
                                </span>
                        </label>
                    </div>
                </div>
                <div>
                    <div class="input-append">
                        <label>* <spring:message code="patients.phone"/>:</label>
                    </div>
                    <div class="input-append">
                        <input type="text"
                               required
                               ng-model="patient.phoneNumber"
                               name="phoneNumber"
                               placeholder="<spring:message code='sample.phone'/> "/>
                    </div>
                    <div class="input-append">
                        <label>
                                <span class="alert alert-error"
                                      ng-show="displayValidationError && updatePatientForm.phoneNumber.$error.required">
                                    <spring:message code="required"/>
                                </span>
                        </label>
                    </div>
                </div>
                <input type="submit"
                       class="btn btn-inverse"
                       ng-click="updatePatient(updatePatientForm);"
                       value='<spring:message code="update"/>'/>
                <button class="btn btn-inverse"
                        data-dismiss="modal"
                        ng-click="exit('#updatePatientsModal');"
                        aria-hidden="true">
                    <spring:message code="cancel"/></button>
            </div>
        </form>
    </div>
    <span class="alert alert-error dialogErrorMessage"
          ng-show="errorOnSubmit">
        <spring:message code="request.error"/>
    </span>
</div>

<div id="deletePatientsModal"
     class="modal hide fade in centering"
     role="dialog"
     aria-labelledby="searchPatientsModalLabel"
     aria-hidden="true">
    <div class="modal-header">
        <h3 id="deletePatientsModalLabel" class="displayInLine">
            <spring:message code="delete"/>&nbsp;<spring:message code="patient"/>
        </h3>
    </div>
    <div class="modal-body">
        <form name="deletePatientForm" novalidate>
            <p><spring:message code="delete.confirm"/>:&nbsp;{{patient.name}}?</p>

            <input type="submit"
                   class="btn btn-inverse"
                   ng-click="deletePatient();"
                   value='<spring:message code="delete"/>'/>
            <button class="btn btn-inverse"
                    data-dismiss="modal"
                    ng-click="exit('#deletePatientsModal');"
                    aria-hidden="true">
                <spring:message code="cancel"/>
            </button>
        </form>
    </div>
    <span class="alert alert-error dialogErrorMessage"
          ng-show="errorOnSubmit">
        <spring:message code="request.error"/>
    </span>
    <span class="alert alert-error dialogErrorMessage"
          ng-show="errorIllegalAccess">
        <spring:message code="request.illegal.access"/>
    </span>
</div>

<div id="searchPatientsModal"
     class="modal hide fade in centering"
     role="dialog"
     aria-labelledby="searchPatientsModalLabel"
     aria-hidden="true">
    <div class="modal-header">
        <h3 id="searchPatientsModalLabel" class="displayInLine">
            <spring:message code="search"/>
        </h3>
    </div>
    <div class="modal-body">
        <form name="searchPatientForm" novalidate>
            <label><spring:message code="search.for"/></label>

            <div>
                <div class="input-append">
                    <input type="text"
                           autofocus
                           required
                           ng-model="searchFor"
                           name="searchFor"
                           placeholder="<spring:message code='patient'/>&nbsp;<spring:message code='patients.name'/> "/>
                </div>
                <div class="input-append displayInLine">
                    <label class="displayInLine">
                        <span class="alert alert-error"
                              ng-show="displayValidationError && searchPatientForm.searchFor.$error.required">
                            <spring:message code="required"/>
                        </span>
                    </label>
                </div>
            </div>
            <input type="submit"
                   class="btn btn-inverse"
                   ng-click="searchPatient(searchPatientForm, false);"
                   value='<spring:message code="search"/>'
                    />
            <button class="btn btn-inverse"
                    data-dismiss="modal"
                    ng-click="exit('#searchPatientsModal');"
                    aria-hidden="true">
                <spring:message code="cancel"/>
            </button>
        </form>
    </div>
    <span class="alert alert-error dialogErrorMessage"
          ng-show="errorOnSubmit">
        <spring:message code="request.error"/>
    </span>
</div>
