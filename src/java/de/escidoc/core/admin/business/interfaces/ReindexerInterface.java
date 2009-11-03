/*
 * CDDL HEADER START
 *
 * The contents of this file are subject to the terms of the
 * Common Development and Distribution License, Version 1.0 only
 * (the "License").  You may not use this file except in compliance
 * with the License.
 *
 * You can obtain a copy of the license at license/ESCIDOC.LICENSE
 * or http://www.escidoc.de/license.
 * See the License for the specific language governing permissions
 * and limitations under the License.
 *
 * When distributing Covered Code, include this CDDL HEADER in each
 * file and include the License file at license/ESCIDOC.LICENSE.
 * If applicable, add the following below this CDDL HEADER, with the
 * fields enclosed by brackets "[]" replaced with your own identifying
 * information: Portions Copyright [yyyy] [name of copyright owner]
 *
 * CDDL HEADER END
 */

/*
 * Copyright 2008 Fachinformationszentrum Karlsruhe Gesellschaft
 * fuer wissenschaftlich-technische Information mbH and Max-Planck-
 * Gesellschaft zur Foerderung der Wissenschaft e.V.  
 * All rights reserved.  Use is subject to license terms.
 */package de.escidoc.core.admin.business.interfaces;

import java.util.Collection;

import de.escidoc.core.common.exceptions.system.ApplicationServerSystemException;
import de.escidoc.core.common.exceptions.system.SystemException;

public interface ReindexerInterface {

    /**
     * Clear all resources from index.
     * 
     * @throws SystemException
     *             Thrown if an internal error occurred.
     */
    void clearIndex() throws SystemException;

    /**
     * Close Connection to SB-Indexing-Queue.
     * 
     * @admin
     */
    void close();

    /**
     * Get all publicly available Items from OM and put hrefs into Vector.
     * 
     * @return Vector item-hrefs
     * 
     * @throws SystemException
     *             Thrown if an internal error occurred.
     * @admin
     */
    Collection<String> getFilteredItems() throws SystemException;

    /**
     * Get all publicly available Containers from OM and put hrefs into Vector.
     * 
     * @return Vector container-hrefs
     * 
     * @throws SystemException
     *             Thrown if an internal error occurred.
     * @admin
     */
    Collection<String> getFilteredContainers()
        throws SystemException;

    /**
     * Get all publicly available Organizational Units from OUM and put hrefs
     * into Vector.
     * 
     * @return Vector org-unit-hrefs
     * 
     * @throws SystemException
     *             Thrown if an internal error occurred.
     * @admin
     */
    Collection<String> getFilteredOrganizationalUnits()
        throws SystemException;

    /**
     * retrieve resource.
     * 
     * @param resource
     *            String resourceIdentifier
     * @return String resource as xml.
     * 
     * @throws ApplicationServerSystemException
     *             e
     * @admin
     */
    String retrieveResource(final String resource)
        throws ApplicationServerSystemException;

    /**
     * get object from FedoraManagementDeviationHandler.
     * 
     * @param resource
     *            String resourceIdentifier
     * @return Object resource as xml.
     * 
     * @throws ApplicationServerSystemException
     *             e
     * @admin
     */
    Object fedoraExport(final String resource)
        throws ApplicationServerSystemException;

    /**
     * get fulltext from FedoraAccessDeviationHandler.
     * 
     * @param resource
     *            String resourceIdentifier
     * @return Object resource as Object.
     * 
     * @throws ApplicationServerSystemException
     *             e
     * @admin
     */
    Object fedoraGetDatastreamDissemination(final String resource)
        throws ApplicationServerSystemException;

    /**
     * @param resource
     *            String resource.
     * @param objectType
     *            type of the resource.
     * 
     * @throws ApplicationServerSystemException
     *             e
     */
    void sendUpdateIndexMessage(final String resource, final String objectType)
        throws ApplicationServerSystemException;
}
