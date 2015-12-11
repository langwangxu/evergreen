package org.anran.common.util;

import java.util.List;

public class PageListUtil {
	/**
	 * 默认的起始页
	 */
	public static final int DEFAULT_PAGE_NO=1;
	
	/**
	 * 默认的分页每页显示记录数	 
	 */
	public static final int DEFAULT_PAGE_SIZE=2;
	
	public static final String PAGE_NO_NAME="pageNo";
	
	public static final String PAGE_SIZE_NAME="pageSize";
	
    /**
     * 不关心记录总数
     * @param pageNumber
     * @param pageSize
     * @return
     */
    public static int getPageListStart(int pageNumber, int pageSize) {
        return (pageNumber - 1) * pageSize;
    }
    
    /**
     * 计算分页获取数据时游标的起始位置
     * @param totalCount
     * @param pageNumber
     * @param pageSize
     * @return
     */
    public static int getPageListStart(int totalCount, int pageNumber, int pageSize) {
        int start = (pageNumber - 1) * pageSize;
        if (start >= totalCount)
            start = 0;

        return start;
    }

    /**
     * 构建当前分页对象
     * @param totalCount
     * @param pageIndex
     * @param items
     * @param pageSize
     * @return
     */
    public static <Entity> PageList<Entity> getPageList(int totalCount, int pageIndex, int pageSize, List<Entity> items) {
        return new PageList<Entity>(totalCount, pageIndex, pageSize, items);
    }
}
