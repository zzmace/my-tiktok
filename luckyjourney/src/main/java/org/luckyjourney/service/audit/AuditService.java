package org.luckyjourney.service.audit;

import java.util.function.Supplier;

public interface AuditService<T,R> {

    /**
     *  审核规范
     * @param task
     * @return
     */
    R audit(T task);
}
